program TFlickrDownloader;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  UnitMain in 'Forms\UnitMain.pas' {MainForm},
  UnitImagePagesExtractor in 'Units\UnitImagePagesExtractor.pas',
  UnitParseImagePage in 'Units\UnitParseImagePage.pas',
  UnitPhotoDownloader in 'Units\UnitPhotoDownloader.pas',
  UnitNewProjectForm in 'Forms\UnitNewProjectForm.pas' {NewProjectForm},
  UnitFinalImageLinkExtractor in 'Units\UnitFinalImageLinkExtractor.pas',
  UnitFlickrDownloadWorker in 'Units\UnitFlickrDownloadWorker.pas',
  UnitCommonTypes in 'Units\UnitCommonTypes.pas',
  UnitSettings in 'Forms\UnitSettings.pas' {SettingsForm},
  UnitPhotoStreamPageCountExtractor in 'Units\UnitPhotoStreamPageCountExtractor.pas',
  windows7taskbar in 'Units\windows7taskbar.pas',
  UnitEditProjectForm in 'Forms\UnitEditProjectForm.pas' {EditProjectForm},
  UnitExifWriter in 'Units\UnitExifWriter.pas',
  UnitDownloadLogForm in 'Forms\UnitDownloadLogForm.pas' {DownloadLogForm},
  UnitWarning in 'Forms\UnitWarning.pas' {WarningForm},
  UnitAbout in 'Forms\UnitAbout.pas' {AboutForm},
  UnitImageTypeExtractor in 'Units\UnitImageTypeExtractor.pas',
  CCR.Exif in 'CCR\CCR.Exif.pas',
  CCR.Exif.BaseUtils in 'CCR\CCR.Exif.BaseUtils.pas',
  CCR.Exif.Consts in 'CCR\CCR.Exif.Consts.pas',
  CCR.Exif.IPTC in 'CCR\CCR.Exif.IPTC.pas',
  CCR.Exif.JpegUtils in 'CCR\CCR.Exif.JpegUtils.pas',
  CCR.Exif.StreamHelper in 'CCR\CCR.Exif.StreamHelper.pas',
  CCR.Exif.TagIDs in 'CCR\CCR.Exif.TagIDs.pas',
  CCR.Exif.TiffUtils in 'CCR\CCR.Exif.TiffUtils.pas',
  CCR.Exif.XMPUtils in 'CCR\CCR.Exif.XMPUtils.pas',
  ImgSize in 'Units\ImgSize.pas',
  UnitFileInfo in 'Units\UnitFileInfo.pas',
  Vcl.Themes,
  Vcl.Styles,
  UnitFlickrGroupPhotoLinksDownloader in 'Units\UnitFlickrGroupPhotoLinksDownloader.pas',
  UnitDownloader in 'Units\UnitDownloader.pas',
  UnitEncoder in 'Units\UnitEncoder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TFlickrDownloader';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNewProjectForm, NewProjectForm);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TEditProjectForm, EditProjectForm);
  Application.CreateForm(TDownloadLogForm, DownloadLogForm);
  Application.CreateForm(TWarningForm, WarningForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;

end.
