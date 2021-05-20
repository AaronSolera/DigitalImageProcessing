function ret = runApp()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _app1BasePath = dir;
  global _app1ImgPath = [dir filesep() 'img'];
  addpath([dir filesep() "libs" ]);
  addpath([dir filesep() "fcn" ]);
  addpath([dir filesep() "wnd" ]);
  waitfor(main().figure);
end
