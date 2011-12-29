<h1>Lista z zadaniami</h1>
<table class="bordered-table zebra-striped">
  <thead>
    <th>Pytanie</th>
    <th>Rozwiązanie</th>
    <th>Trudność</th>
    <th>Data utworzenia</th>
  </thead>
  <tbody>
    {foreach $exercises as $exercise}
      <tr>
        <td>{$exercise["content"]}</td>
        <td>{$exercise["solution"]}</td>
        <td>{$exercise["difficulty"]}</td>
        <td>{$exercise["create_date"]}</td>
      </tr>
    {/foreach}
  </tbody>
</table>
