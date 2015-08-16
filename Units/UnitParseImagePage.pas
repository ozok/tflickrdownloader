{ *
  * Copyright (C) 2014-2015 ozok <ozok26@gmail.com>
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

unit UnitParseImagePage;

interface

uses Classes, Windows, SysUtils, Messages, StrUtils;

type
  TImagePageParser = class(TObject)
  private
    FImageType: integer;
    FInputFilePath: string;
    FOutputFilePath: string;
    FImageCount: integer;

    function CorrectLink(const Link: string):string;
  public
    property ImageCount: integer read FImageCount;
    property ImagePageLinkFilePath: string read FOutputFilePath;

    procedure ConvertLinks;

    constructor Create(const InputFilePath: string; const ImageType: integer; const OutputFilePath: string);
    destructor Destroy(); override;
  end;

implementation

{ TImagePageParser }

procedure TImagePageParser.ConvertLinks;
var
  LStreamWriter: TStreamWriter;
  LStreamReader: TStreamReader;
  LLine: string;
begin

  LStreamReader := TStreamReader.Create(FInputFilePath, True);
  LStreamWriter := TStreamWriter.Create(FOutputFilePath, False);
  try
    while not LStreamReader.EndOfStream do
    begin
      LLine := LStreamReader.ReadLine;
      case FImageType of
        0:
          begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/sq/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/q/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/t/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/s/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/n/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/m/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/z/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/c/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/l/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/h/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/k/in/photostream');
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/o/in/photostream');
            Inc(FImageCount, 12);
        end;
      1:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/sq/in/photostream');
            Inc(FImageCount);
        end;
      2:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/q/in/photostream');
            Inc(FImageCount);
        end;
      3:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/t/in/photostream');
            Inc(FImageCount);
        end;
      4:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/s/in/photostream');
            Inc(FImageCount);
        end;
      5:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/n/in/photostream');
            Inc(FImageCount);
        end;
      6:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/m/in/photostream');
            Inc(FImageCount);
        end;
      7:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/z/in/photostream');
            Inc(FImageCount);
        end;
      8:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/c/in/photostream');
            Inc(FImageCount);
        end;
      9:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/l/in/photostream');
            Inc(FImageCount);
        end;
      10:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/h/in/photostream');
            Inc(FImageCount);
        end;
      11:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/k/in/photostream');
            Inc(FImageCount);
        end;
      12:
        begin
            LStreamWriter.WriteLine(CorrectLink(LLine)+ 'sizes/o/in/photostream');
            Inc(FImageCount);
        end;
    end;
  end;
  finally
    LStreamWriter.Flush;
    LStreamReader.Close;
    LStreamWriter.Close;
    FreeAndNil(LStreamReader);
    FreeAndNil(LStreamWriter);
  end;

end;

function TImagePageParser.CorrectLink(const Link: string): string;
var
  LLink: string;
  SetPos: integer;
begin
  Result := Link;

  LLink := Link;

  SetPos := Pos('in/set-', LLink);

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

constructor TImagePageParser.Create(const InputFilePath: string; const ImageType: integer; const OutputFilePath: string);
begin
  inherited Create;

  FInputFilePath := InputFilePath;
  FOutputFilePath := OutputFilePath;
  FImageType := ImageType;
  FImageCount := 0;
end;

destructor TImagePageParser.Destroy;
begin
  inherited Destroy;
end;

end.
