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
        <td>{$exercise["CONTENT"]}</td>
        <td>{$exercise["SOLUTION"]}</td>
        <td>{$exercise["DIFFICULTY"]}</td>
        <td>{$exercise["CREATE_DATE"]}</td>
      </tr>
    {/foreach}
  </tbody>
</table>
