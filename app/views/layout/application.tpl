<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>Zadania</title>
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="stylesheet" href="{$root}/assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="{$root}/assets/css/style.css">
</head>

<body>
    <div class="topbar">
      <div class="topbar-inner masthead">
        <div class="container-fluid">
          <a class="brand" href="{$root}">Strona główna</a>
          <ul class="nav">
            <li class="dropdown" data-dropdown="dropdown">
              <a href="{$root}/zadania" class="dropdown-toggle">Zadania</a>
              <ul class="dropdown-menu">
                {link_to n="Lista zadań" l="/zadania" nav=1}
                {link_to n="Dodaj zadanie" l="/zadania/nowe" nav=1}
              </ul>
            </li>
            <li class="dropdown" data-dropdown="dropdown">
              <a href="{$root}/kategorie" class="dropdown-toggle">Kategorie</a>
              <ul class="dropdown-menu">
                {link_to n="Lista kategorii" l="/kategorie" nav=1}
                {link_to n="Utwórz kategorię" l="/kategorie/nowa" nav=1}
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  <div class="container-fluid">
      <div class="sidebar">
        <div class="well">
          <h5>Ostatnie zadania</h5>
          <ul>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
          </ul>
        </div>
      </div>
    <div class="content">
      {$yield}

      <footer>
        2011 &copy; Ktośtam&Ktośtam
      </footer>
    </div>
  </div> <!--! end of .container -->



  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="{$root}/assets/js/jquery.min.js"></script>
  <script src="{$root}/assets/js/bootstrap-dropdown.js"></script>


</body>
</html>