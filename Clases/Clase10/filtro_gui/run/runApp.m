function ret = runApp()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _filtro_guiBasePath = dir;
  global _filtro_guiImgPath = [dir filesep() 'img'];
  addpath([dir filesep() "libs" ]);
  addpath([dir filesep() "fcn" ]);
  addpath([dir filesep() "wnd" ]);
  waitfor(main().figure);
end
