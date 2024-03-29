<h1>Twoje zadania</h1>
<table class="bordered-table zebra-striped">
  <thead>
  <th>Pytanie</th>
  <th>Rozwiązanie</th>
  <th>Trudność</th>
  <th>Data utworzenia</th>
  <th>Widoczność</th>
  <th>Akcje</th>
  </thead>
  <tbody>
  {foreach $exercises as $exercise}
  <tr>
    <td>{$exercise["content"]}</td>
    <td>{$exercise["solution"]}</td>
    <td>{$exercise["difficulty"]}</td>
    <td>{$exercise["create_date"]}</td>
    <td>{($exercise["hidden"] == "0") ? "Widoczne" : "Niewidoczne" }</td>
    <td>
      <form action="{$root}/zadania/edytuj" method="post">
        <input type="hidden" name="id" id="id" value="{$exercise["id"]}" \>
        <button type="submit" class="btn secondary-action">Edytuj</button>
      </form>
      <a href="{$root}/zadania/podglad/?id={$exercise["id"]}">Pokaż</a>
    </td>
  </tr>
  {/foreach}
  </tbody>
</table>