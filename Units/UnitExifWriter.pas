{ *
  * Copyright (C) 2014 ozok <ozok26@gmail.com>
  *
  * This file is part of TFlickrDownloader.
  *
  * TFlickrDownloader is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 2 of the License, or
  * (at your option) any later version.
  *
  * TFlickrDownloader is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with TFlickrDownloader.  If not, see <http://www.gnu.org/licenses/>.
  *
  * }

unit UnitExifWriter;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils, UnitDownloader, UnitCommonTypes, CCR.Exif, CCR.Exif.BaseUtils;

type
  TEWStatus = (ewDownloading, ewDone);

type
  TExifWriter = class(TObject)
  private
    FPageDownloader: TDownloader;
    FStatus: TEWStatus;
    FImgPath: string;
    FPercentage: integer;
    FPhotoLink: string;
    FFileSize: int64;
    FImgPageLink: string;
    FExifData: TExifInfo;
    FErrorMsg: TExifWriterResult;
    FURL: string;
    FTempFolder: string;

    function RemoveHTMLTags(const Str: string): string;
    function StripHtmlMarkup(const source: string): string;
    function RemovePlusDate(const Str: string): string;

    procedure WriteExifData();
    function CorrectLink(const Link: string): string;
    procedure ParsePage;
  public
    property ExtractorStatus: TEWStatus read FStatus;
    property ErrorMessage: TExifWriterResult read FErrorMsg;
    property PhotoLink: string read FPhotoLink;
    property Percentage: integer read FPercentage;
    property FileSize: int64 read FFileSize;

    constructor Create(const ImgPath: string; const ImgPageLink: string; const TempFolder: string);
    destructor Destroy(); override;

    procedure Start();
    procedure Stop();
  end;

implementation

{ TExifWriter }

function TExifWriter.CorrectLink(const Link: string): string;
var
  LLink: string;
  SetPos: integer;
begin
  Result := Link;

  LLink := Link;

  SetPos := Pos('sizes', LLink);

  if SetPos > -1 then
  begin
    Delete(LLink, SetPos, MAXINT);
  end;

  if LLink[Length(LLink)] <> '/' then
  begin
    LLink := LLink + '/'
  end;

  Result := LLink;
end;

constructor TExifWriter.Create(const ImgPath: string; const ImgPageLink: string; const TempFolder: string);
begin
  inherited Create;
  FPageDownloader := TDownloader.Create;

  FStatus := ewDownloading;
  FImgPath := ImgPath;
  FURL := ImgPageLink;
  FPercentage := 0;
  FImgPageLink := CorrectLink(ImgPageLink);
  FErrorMsg := exFailedToOpen;
  FTempFolder := TempFolder;
end;

destructor TExifWriter.Destroy;
begin
  inherited Destroy;
  if FileExists(FTempFolder + '\' + ChangeFileExt(ExtractFileName(FImgPath), '_.txt')) then
  begin
    DeleteFile(FTempFolder + '\' + ChangeFileExt(ExtractFileName(FImgPath), '_.txt'));
  end;
  FPageDownloader.Free;
end;

procedure TExifWriter.ParsePage;
// exif tags in html page.
// thx to python I didn't need to write this all by hand.
const
{$REGION 'ExifFields'}
  Camera = '<th>Camera</th>';
  Exposure = '<th>Exposure</th>';
  Aperture = '<th>Aperture</th>';
  Focal_Length = '<th>Focal Length</th>';
  ISO_Speed = '<th>ISO Speed</th>';
  Exposure_Bias = '<th>Exposure Bias</th>';
  Flash = '<th>Flash</th>';
  X_Resolution = '<th>X-Resolution</th>';
  Y_Resolution = '<th>Y-Resolution</th>';
  Orientation = '<th>Orientation</th>';
  Software = '<th>Software</th>';
  Date_and_Time_Modified = '<th>Date and Time (Modified)</th>';
  YCbCr_Positioning = '<th>YCbCr Positioning</th>';
  Exposure_Program = '<th>Exposure Program</th>';
  Date_and_Time_Original = '<th>Date and Time (Original)</th>';
  Date_and_Time_Digitized = '<th>Date and Time (Digitized)</th>';
  Metering_Mode = '<th>Metering Mode</th>';
  Sub_Sec_Time_Digitized = '<th>Sub Sec Time Digitized</th>';
  Color_Space = '<th>Color Space</th>';
  Focal_Plane_X_Resolution = '<th>Focal Plane X-Resolution</th>';
  Focal_Plane_Y_Resolution = '<th>Focal Plane Y-Resolution</th>';
  Custom_Rendered = '<th>Custom Rendered</th>';
  Exposure_Mode = '<th>Exposure Mode</th>';
  White_Balance = '<th>White Balance</th>';
  Scene_Capture_Type = '<th>Scene Capture Type</th>';
  Compression = '<th>Compression</th>';
  Global_Angle = '<th>Global Angle</th>';
  Global_Altitude = '<th>Global Altitude</th>';
  Copyright_Flag = '<th>Copyright Flag</th>';
  Photoshop_Quality = '<th>Photoshop Quality</th>';
  Photoshop_Format = '<th>Photoshop Format</th>';
  Progressive_Scans = '<th>Progressive Scans</th>';
  XMPToolkit = '<th>XMPToolkit</th>';
  Creator_Tool = '<th>Creator Tool</th>';
  Metadata_Date = '<th>Metadata Date</th>';
  Format = '<th>Format</th>';
  Color_Mode = '<th>Color Mode</th>';
  ICCProfile_Name = '<th>ICCProfile Name</th>';
  Viewing_Conditions_Illuminant_Type = '<th>Viewing Conditions Illuminant Type</th>';
  Measurement_Observer = '<th>Measurement Observer</th>';
  Measurement_Flare = '<th>Measurement Flare</th>';
  Measurement_Illuminant = '<th>Measurement Illuminant</th>';
  Color_Transform = '<th>Color Transform</th>';
  Flash_Return = '<th>Flash Return</th>';
  Flash_Mode = '<th>Flash Mode</th>';
  Flash_Function = '<th>Flash Function</th>';
  Flash_Red_Eye_Mode = '<th>Flash Red Eye Mode</th>';
{$ENDREGION}
var
  LTmpStr: TStreamReader;
  LLine: AnsiString;
begin
  FFileSize := FileSize;
  FPercentage := 100;

  FStatus := ewDownloading;
  try
    if FileSize > 0 then
    begin
      LTmpStr := TStreamReader.Create(FPageDownloader.OutputFileName);
      try
        while not LTmpStr.EndOfStream do
        begin
          LLine := Trim(LTmpStr.ReadLine);
{$REGION 'ElseIfs'}
          if Copy(LLine, 1, Length(Camera)) = Camera then
          begin
            FExifData.Camera := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Exposure)) = Exposure then
          begin
            FExifData.Exposure := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Aperture)) = Aperture then
          begin
            FExifData.Aperture := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Focal_Length)) = Focal_Length then
          begin
            FExifData.FocalLength := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(ISO_Speed)) = ISO_Speed then
          begin
            FExifData.ISOSpeed := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Exposure_Bias)) = Exposure_Bias then
          begin
            FExifData.ExposureBias := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Flash)) = Flash then
          begin
            FExifData.Flash := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(X_Resolution)) = X_Resolution then
          begin
            FExifData.XResolution := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Y_Resolution)) = Y_Resolution then
          begin
            FExifData.YResolution := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Orientation)) = Orientation then
          begin
            FExifData.Orientation := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Software)) = Software then
          begin
            FExifData.Software := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Date_and_Time_Modified)) = Date_and_Time_Modified then
          begin
            FExifData.DateandTimeModified := RemovePlusDate(RemoveHTMLTags(LTmpStr.ReadLine));
          end
          else if Copy(LLine, 1, Length(YCbCr_Positioning)) = YCbCr_Positioning then
          begin
            FExifData.YCbCrPositioning := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Exposure_Program)) = Exposure_Program then
          begin
            FExifData.ExposureProgram := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Date_and_Time_Original)) = Date_and_Time_Original then
          begin
            FExifData.DateandTimeOriginal := RemovePlusDate(RemoveHTMLTags(LTmpStr.ReadLine));
          end
          else if Copy(LLine, 1, Length(Date_and_Time_Digitized)) = Date_and_Time_Digitized then
          begin
            FExifData.DateandTimeDigitized := RemovePlusDate(RemoveHTMLTags(LTmpStr.ReadLine));
          end
          else if Copy(LLine, 1, Length(Metering_Mode)) = Metering_Mode then
          begin
            FExifData.MeteringMode := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Sub_Sec_Time_Digitized)) = Sub_Sec_Time_Digitized then
          begin
            FExifData.SubSecTimeDigitized := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Color_Space)) = Color_Space then
          begin
            FExifData.ColorSpace := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Focal_Plane_X_Resolution)) = Focal_Plane_X_Resolution then
          begin
            FExifData.FocalPlaneXResolution := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Focal_Plane_Y_Resolution)) = Focal_Plane_Y_Resolution then
          begin
            FExifData.FocalPlaneYResolution := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Custom_Rendered)) = Custom_Rendered then
          begin
            FExifData.CustomRendered := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Exposure_Mode)) = Exposure_Mode then
          begin
            FExifData.ExposureMode := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(White_Balance)) = White_Balance then
          begin
            FExifData.WhiteBalance := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Scene_Capture_Type)) = Scene_Capture_Type then
          begin
            FExifData.SceneCaptureType := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Compression)) = Compression then
          begin
            FExifData.Compression := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Global_Angle)) = Global_Angle then
          begin
            FExifData.GlobalAngle := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Global_Altitude)) = Global_Altitude then
          begin
            FExifData.GlobalAltitude := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Copyright_Flag)) = Copyright_Flag then
          begin
            FExifData.CopyrightFlag := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Photoshop_Quality)) = Photoshop_Quality then
          begin
            FExifData.PhotoshopQuality := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Photoshop_Format)) = Photoshop_Format then
          begin
            FExifData.PhotoshopFormat := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Progressive_Scans)) = Progressive_Scans then
          begin
            FExifData.ProgressiveScans := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(XMPToolkit)) = XMPToolkit then
          begin
            FExifData.XMPToolkit := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Orientation)) = Orientation then
          begin
            FExifData.Orientation := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Creator_Tool)) = Creator_Tool then
          begin
            FExifData.CreatorTool := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Metadata_Date)) = Metadata_Date then
          begin
            FExifData.MetadataDate := RemovePlusDate(RemoveHTMLTags(LTmpStr.ReadLine));
          end
          else if Copy(LLine, 1, Length(Format)) = Format then
          begin
            FExifData.Format := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Color_Mode)) = Color_Mode then
          begin
            FExifData.ColorMode := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(ICCProfile_Name)) = ICCProfile_Name then
          begin
            FExifData.ICCProfileName := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Viewing_Conditions_Illuminant_Type)) = Viewing_Conditions_Illuminant_Type then
          begin
            FExifData.ViewingConditionsIlluminantType := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Measurement_Observer)) = Measurement_Observer then
          begin
            FExifData.MeasurementObserver := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Measurement_Flare)) = Measurement_Flare then
          begin
            FExifData.MeasurementFlare := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Measurement_Illuminant)) = Measurement_Illuminant then
          begin
            FExifData.MeasurementIlluminant := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Color_Transform)) = Color_Transform then
          begin
            FExifData.ColorTransform := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Flash_Return)) = Flash_Return then
          begin
            FExifData.FlashReturn := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Flash_Mode)) = Flash_Mode then
          begin
            FExifData.FlashMode := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Flash_Function)) = Flash_Function then
          begin
            FExifData.FlashFunction := RemoveHTMLTags(LTmpStr.ReadLine);
          end
          else if Copy(LLine, 1, Length(Flash_Red_Eye_Mode)) = Flash_Red_Eye_Mode then
          begin
            FExifData.FlashRedEyeMode := RemoveHTMLTags(LTmpStr.ReadLine);
          end;
{$ENDREGION}
        end;
      finally
        LTmpStr.Close;
        FreeAndNil(LTmpStr);

        WriteExifData;
      end;
    end;
  finally
    FStatus := ewDone;
  end;
end;

function TExifWriter.RemoveHTMLTags(const Str: string): string;
begin
  Result := Str;
  Result := ReplaceStr(Result, '<td>', '');
  Result := ReplaceStr(Result, '</td>', '');
  Result := Trim(Result);
  Result := StripHtmlMarkup(Result);
end;

function TExifWriter.RemovePlusDate(const Str: string): string;
var
  ltmp: string;
begin
  Result := Str;
  if PosEx('+', Str) > 0 then
  begin
    ltmp := Str;
    Delete(ltmp, PosEx('+', Str) - 1, MAXINT);
    Result := ltmp;
  end;
end;

procedure TExifWriter.Start;
begin
  if FileExists(FImgPath) then
  begin
    FStatus := ewDownloading;
    try
      FPageDownloader.URL := FURL;
      FPageDownloader.OutputFileName := FTempFolder + '\' + ChangeFileExt(ExtractFileName(FImgPath), '_.txt');
      // wait until downloading is done
      FPageDownloader.Start;
      while FPageDownloader.Status = ds2Downloading do
      begin
        Sleep(50);
      end;
      FFileSize := FPageDownloader.FileSize;
      ParsePage;
    finally
      FStatus := ewDone;
    end;
  end
  else
  begin
    FStatus := ewDone;
  end;
end;

procedure TExifWriter.Stop;
begin
  if FStatus = ewDownloading then
  begin
    FPageDownloader.Stop;
  end;
end;

function TExifWriter.StripHtmlMarkup(const source: string): string;
var
  i, count: Integer;
  InTag: Boolean;
  P: PChar;
begin
  SetLength(Result, Length(source));
  P := PChar(Result);
  InTag := False;
  count := 0;
  for i := 1 to Length(source) do
    if InTag then
    begin
      if source[i] = '>' then
        InTag := False;
    end
    else if source[i] = '<' then
      InTag := True
    else
    begin
      P[count] := source[i];
      Inc(count);
    end;
  SetLength(Result, count);
end;

procedure TExifWriter.WriteExifData;
var
  LExifWriter: TExifData;
  // ls: TStreamWriter;
  ldate: TDateTimeTagValue;
  LAperture: TExifFraction;
  LFocalLength: TExifFraction;
begin

  FErrorMsg := exOK;
  LExifWriter := TExifData.Create();
  // ls := TStreamWriter.Create('C:\exif.txt');
  try
    // start writing
    if LExifWriter.LoadFromGraphic(FImgPath) then
    begin
      LExifWriter.CameraMake := FExifData.Camera;
      LExifWriter.CameraModel := FExifData.Camera;
      // ls.WriteLine(FExifData.Camera);
      LExifWriter.Copyright := FExifData.CopyrightFlag;
      ldate := TDateTimeTagValue.CreateFromString(StringReplace(FExifData.DateandTimeOriginal, ':', '.', [rfReplaceAll]));
      // ls.WriteLine(StringReplace(FExifData.DateandTimeOriginal, ':', '.', [rfReplaceAll]));
      LExifWriter.DateTimeOriginal := ldate;
      ldate := TDateTimeTagValue.CreateFromString(FExifData.DateandTimeModified);
      LExifWriter.DateTime := ldate;
      ldate := TDateTimeTagValue.CreateFromString(FExifData.DateandTimeDigitized);
      LExifWriter.DateTimeDigitized := ldate;
      LExifWriter.Software := FExifData.Software;
      LAperture := TExifFraction.CreateFromString(FExifData.Aperture);
      LExifWriter.ApertureValue := LAperture;
      LFocalLength := TExifFraction.CreateFromString(StringReplace(FExifData.FocalLength, ' mm', '', [rfReplaceAll]));
      LExifWriter.FocalLength := LFocalLength;
      if Copy(FExifData.Flash, 1, 3) = 'Off' then
      begin
        LExifWriter.Flash.Fired := False;
      end
      else
      begin
        LExifWriter.Flash.Fired := True;
      end;
    end
    else
    begin
      FErrorMsg := exFailedToOpen;
    end;
  finally
    // save to image file
    LExifWriter.SaveToGraphic(FImgPath);
    LExifWriter.Free;

    // ls.Close;
    // ls.Free;
  end;

end;

end.
