<h1>Utwórz nowe zadanie</h1>
<form action="{$root}/zadania/utworz" method="post">
        <fieldset>
          <div class="clearfix">
            <label for="content">Treść</label>
            <div class="input">
              <textarea id="content" name="content"></textarea>
            </div>
          </div><!-- /clearfix -->
          <div class="clearfix">
            <label for="content">Rozwiązanie</label>
            <div class="input">
              <textarea id="solution" name="solution"></textarea>
            </div>
          </div><!-- /clearfix -->
          <div class="clearfix">
            <label for="hidden">Widoczność</label>
            <div class="input">
              <select name="hidden" id="hidden">
                <option value="0">Widoczny</option>
                <option value="1">Ukryty</option>
              </select>
            </div>
          </div>
          <div class="clearfix">
            <label for="hidden">Trudność</label>
            <div class="input">
              <select name="difficulty" id="difficulty">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
              </select>
            </div>
          </div>
        </fieldset>
        <div class="actions">
          <button type="submit" class="btn primary">Utwórz zadanie</button>
        </div>
      </form>