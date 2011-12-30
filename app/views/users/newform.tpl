<h1>Rejestracja</h1>
<form action="{$root}/uzytkownik/utworz" method="post">
  <fieldset>
    <div class="clearfix">
      <label for="nickname">Pseudonim</label>
      <div class="input">
        <input id="nickname" name="nickname" type="text" value="{$_GET["nickname"]}"/>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="name">Imię</label>
      <div class="input">
        <input id="name" name="name" type="text" value="{$_GET["name"]}"/>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="surname">Nazwisko</label>
      <div class="input">
        <input id="surname" name="surname" type="text" value="{$_GET["surname"]}"/>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="email">e-mail</label>
      <div class="input">
        <input id="email" name="email" type="text" value="{$_GET["email"]}"/>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="password">Hasło</label>
      <div class="input">
        <input id="password" name="password" type="password"/>
      </div>
    </div><!-- /clearfix -->
  </fieldset>
  <div class="actions">
    <button type="submit" class="btn primary">Zarejestruj się</button>
  </div>
</form>