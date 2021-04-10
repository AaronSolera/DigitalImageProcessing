function ret = runApp()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _prueba01BasePath = dir;
  global _prueba01ImgPath = [dir filesep() 'img'];
  addpath([dir filesep() "libs" ]);
  addpath([dir filesep() "fcn" ]);
  addpath([dir filesep() "wnd" ]);
  waitfor(mainImagen().figure);
end
