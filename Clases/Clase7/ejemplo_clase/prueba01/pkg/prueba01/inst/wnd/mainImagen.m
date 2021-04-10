## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} mainImagen ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = mainImagen()
[_dir, _name, _ext] = fileparts( mfilename('fullpathext') );
global _prueba01BasePath = strtrunc(_dir, length(_dir) - 4);
global _prueba01ImgPath = [ strtrunc(_dir, length(_dir) - 4) filesep() 'img'];
  mainImagen_def;
  wnd = show_mainImagen();
end
