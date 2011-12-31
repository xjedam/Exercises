<h1>Edytuj zadanie</h1>
<form action="{$root}/zadania/zapisz{($selected_categories)? "?" : "" }{http_build_query($selected_categories)}" method="post">
  <fieldset>
    <div class="clearfix">
      <label for="content">Treść</label>
      <div class="input">
        <textarea id="content" name="content">{$exercise["content"]}</textarea>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="content">Rozwiązanie</label>
      <div class="input">
        <textarea id="solution" name="solution">{$exercise["solution"]}</textarea>
      </div>
    </div><!-- /clearfix -->
    <div class="clearfix">
      <label for="hidden">Widoczność</label>
      <div class="input" >
        <select name="hidden" id="hidden">
          <option value="0" {($exercise["hidden"] == "0") ? "selected=\"selected\"" : "" }>Widoczny</option>
          <option value="1" {($exercise["hidden"] == "1") ? "selected=\"selected\"" : "" }>Ukryty</option>
        </select>
      </div>
    </div>
    <div class="clearfix">
      <label for="hidden">Trudność</label>
      <div class="input">
        <select name="difficulty" id="difficulty">
          <option value="1" {($exercise["difficulty"] == "1") ? "selected=\"selected\"" : "" }>1</option>
          <option value="2" {($exercise["difficulty"] == "2") ? "selected=\"selected\"" : "" }>2</option>
          <option value="3" {($exercise["difficulty"] == "3") ? "selected=\"selected\"" : "" }>3</option>
          <option value="4" {($exercise["difficulty"] == "4") ? "selected=\"selected\"" : "" }>4</option>
          <option value="5" {($exercise["difficulty"] == "5") ? "selected=\"selected\"" : "" }>5</option>
          <option value="6" {($exercise["difficulty"] == "6") ? "selected=\"selected\"" : "" }>6</option>
          <option value="7" {($exercise["difficulty"] == "7") ? "selected=\"selected\"" : "" }>7</option>
          <option value="8" {($exercise["difficulty"] == "8") ? "selected=\"selected\"" : "" }>8</option>
          <option value="9" {($exercise["difficulty"] == "9") ? "selected=\"selected\"" : "" }>9</option>
          <option value="10" {($exercise["difficulty"] == "10") ? "selected=\"selected\"" : "" }>10</option>
        </select>
      </div>
    </div>
    <div class="clearfix">
      <label for="hidden">Kategorie</label>
      <div class="input">
      {foreach $all_categories as $category}
        <input type="checkbox" name="category[]" value="{$category["id"]}" {(isset($selected_categories[$category["id"]])) ? "checked" : "" }/> {$category["name_short"]} <br />
      {/foreach}
      </div>
    </div>
  </fieldset>
  <div class="actions">
    <button type="submit" class="btn primary">Zapisz zadanie</button>
  </div>
  <input type="hidden" name="id" id="id" value="{$exercise["id"]}" \>
</form>