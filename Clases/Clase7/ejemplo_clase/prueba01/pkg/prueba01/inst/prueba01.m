## -*- texinfo -*-
## @deftypefn  {} {@var{ret} =} prueba01 ()
##
## Create and show the main dialog, return a struct as representation of dialog.
##
## @end deftypefn
function ret = prueba01()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _prueba01BasePath = dir;
  global _prueba01ImgPath = [dir filesep() 'img'];
  addpath( [dir filesep() "img" ]);
  addpath( [dir filesep() "fcn" ]);
  addpath( [dir filesep() "libs" ]);
  addpath( [dir filesep() "wnd" ]);
  mainImagen();
end
