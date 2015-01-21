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

unit UnitCommonTypes;

interface

type
  TProjectInfo = packed record
    Name: string;
    StartPage: integer;
    EndPage: integer;
    MaxPage: integer;
    PageLink: string;
    ImageTypeOption: integer;
    OutputFolder: string;
  end;

type
  TExifWriterResult = (exOK = 0, exNoImgFile = 1, exFailedToOpen = 3);

type
  TErrorMessages = (emOK = 0, emAlreadyDownloaded = 1, emEmptyFile = 2, emNotDownloaded = 3, emConnectionTimedOut = 4, emNotStarted = 5, emUnableToExtractLink = 6);

type
  TFailedItem = class
    Link: string;
    ErrorMessage: TErrorMessages;
  end;

type
  TExifInfo = packed record
    Camera, Exposure, Aperture, FocalLength, ISOSpeed, ExposureBias, Flash, XResolution, YResolution, Orientation, Software, DateandTimeModified, YCbCrPositioning, ExposureProgram,
      DateandTimeOriginal, DateandTimeDigitized, MeteringMode, SubSecTimeDigitized, ColorSpace, FocalPlaneXResolution, FocalPlaneYResolution, CustomRendered, ExposureMode, WhiteBalance,
      SceneCaptureType, Compression, GlobalAngle, GlobalAltitude, CopyrightFlag, PhotoshopQuality, PhotoshopFormat, ProgressiveScans, XMPToolkit, CreatorTool, MetadataDate, Format, ColorMode,
      ICCProfileName, ViewingConditionsIlluminantType, MeasurementObserver, MeasurementFlare, MeasurementIlluminant, ColorTransform, FlashReturn, FlashMode, FlashFunction, FlashRedEyeMode: string;
  end;

implementation

end.
