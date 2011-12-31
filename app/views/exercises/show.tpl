<h3>Treść</h3>
{$exercise["content"]}
<h3>Rozwiązanie</h3>
{$exercise["solution"]}
<h3>Stopień trudności</h3>
{$exercise["difficulty"]}
{foreach $comments as $comment}
  <div class="input">
    <textarea class="xlarge" disabled>{$comment["content"]}</textarea>
    <span class="help-block">{$comment["create_date"]} {$comment["account_name"]}</span>
  </div>
{/foreach}