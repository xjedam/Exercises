<?

$smarty->registerPlugin('function','link_to', 'link_to');
function link_to($params,&$smarty){
  $root   = $smarty->getTemplateVars('root');
  $path   = $smarty->getTemplateVars('relative_path');
  $routes = $smarty->getTemplateVars('routes');
  if ($path == $params["l"])
    $active = "class='active'";
  if ($params["nav"])
    return "<li data-path='".$root.$path."' $active><a href='".$root.$params['l']."'>".$params['n']."</a></li>";
  else
    return "<a href='".$root.$params['l']."'>".$params['n']."</a>";

}