{ inputs, den, ... }: {

  imports = [ (inputs.den.namespace "nlm" true) ];
  _module.args.__findFile = den.lib.__findFile;
  
}
