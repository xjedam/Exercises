<h1>Utwórz nową kategorię</h1>
<form action="{$root}/kategorie/utworz" method="post">
        <fieldset>
          <div class="clearfix">
            <label for="name">Nazwa</label>
            <div class="input">
              <input id="name" name="name" type="text"/>
            </div>
          </div><!-- /clearfix -->
          <div class="clearfix">
            <label for="name_short">Nazwa krótka</label>
            <div class="input">
              <input id="name_short" name="name_short" type="text"/>
            </div>
          </div><!-- /clearfix -->
          <div class="clearfix">
            <label for="description">Nazwa krótka</label>
            <div class="input">
              <textarea id="description" name="description"></textarea>
            </div>
          </div><!-- /clearfix -->
          <div class="clearfix">
            <label for="hidden">Widoczność</label>
            <div class="input">
              <select name="hidden" id="hidden">
                <option value="0">Widoczna</option>
                <option value="1">Ukryta</option>
              </select>
            </div>
          </div>
        </fieldset>
        <div class="actions">
          <button type="submit" class="btn primary">Utwórz kategorię</button>
        </div>
      </form>