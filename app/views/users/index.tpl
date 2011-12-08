<h1>Logowanie</h1>
<form action="{$root}/uzytkownik/zaloguj" method="post">
  <fieldset>
    <div class="clearfix">
      <label for="nickname">Pseudonim</label>
      <div class="input">
        <input id="nickname" name="nickname" type="text"/>
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
    <button type="submit" class="btn primary">Zaloguj</button>
  </div>
</form>