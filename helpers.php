<?

$smarty->registerPlugin('function','link_to', 'link_to');
function link_to($params,&$smarty){
  $root   = $smarty->getTemplateVars('root');
  $path   = $smarty->getTemplateVars('relative_path');
  $routes = $smarty->getTemplateVars('routes');
  $active = "";
  if ($path == $params["l"])
    $active = "class='active'";
  if ($params["nav"])
    return "<li data-path='".$root.$path."' $active><a href='".$root.$params['l']."'>".$params['n']."</a></li>";
  else
    return "<a href='".$root.$params['l']."'>".$params['n']."</a>";

}

$smarty->registerPlugin('function','recurse_categories', 'recurse_categories');
function recurse_categories($params, &$smarty){

if (is_array($params['children']) && count($params['children']) > 0) {
   $markup = '';

   $markup .= '<ul>';

   foreach ($params['children'] as $element) {
      $markup .= '<li>';

      $markup .= $element['name'];

      if (isset($element['children'])) {
         $markup .= recurse_categories(array('children' => $element['children']), $smarty);
      }

       $markup .= '</li>';
   }

   $markup.= '</ul>';

   return $markup;

} else {
   return '';
}
}

$smarty->registerPlugin('function','flash_message', 'flash_message');
function flash_message($params, $smarty) {
    $msg = "";
    if (isset($_SESSION['error'])) {
        $msg = $_SESSION['error'];
    } elseif (isset($_SESSION['notice'])) {
        $msg = $_SESSION['notice'];
    }
    unset($_SESSION['error']);
    unset($_SESSION['notice']);
    return $msg;
}
