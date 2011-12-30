<!DOCTYPE html>
<html lang="pl">
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
                {link_to n="Wszystkie zadania" l="/zadania" nav=1}
                {if isset($_SESSION["userId"])}
                  {link_to n="Moje zadania" l="/zadania/moje" nav=1}
                {/if}
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

          <ul class="secondary-nav">
              {if isset($_SESSION["userName"])}
                <li><a href="{$root}">{$_SESSION["userName"]} ({$_SESSION["userGroup"]})</a></li>
                {link_to n="Wyloguj" l="/uzytkownik/wyloguj" nav=1}
              {else}
                  {link_to n="Zaloguj" l="/uzytkownik" nav=1}
                  {link_to n="Rejestracja" l="/uzytkownik/nowy" nav=1}
              {/if}
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

          </ul>
        </div>
      </div>
    <div class="content">
      {if isset($_SESSION["error"])}<div class="alert-message error"><p>{flash_message}</p></div>{/if}
      {if isset($_SESSION["notice"])}<div class="alert-message success"><p>{flash_message}</p></div>{/if}
      {$yield}

      <footer>
        2011 &copy; Ryszard Madejski & Piotr Okoński
      </footer>
    </div>
  </div> <!--! end of .container -->



  <!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
  <script src="{$root}/assets/js/jquery.min.js"></script>
  <script src="{$root}/assets/js/bootstrap-dropdown.js"></script>


</body>
</html>