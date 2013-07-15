<legend>Отчет</legend>

<table class="table table-bordered">
  <thead>
    <tr class="success">
      <th> Область/Класс ЭВМ</th>
      <th>6</th>
      <th>5</th>
      <th>4</th>
      <th>3</th>
      <th>2</th>
      <th>1</th>
      <th>Итого</th>
     </tr>
    </thead>
    <tbody>
      
      <% @districts.each do |district| %>
      <tr>
       <td><%= @region.name %></td>
       <td><%= @comp_count[5] %></td>
       <td><%= @comp_count[4] %></td>
       <td><%= @comp_count[3] %></td>
       <td><%= @comp_count[2] %></td>
       <td><%= @comp_count[1] %></td>
       <td><%= @comp_count[0] %></td>
       <td><%= @summ %></td>
      </tr>
      <% end %>
   
     </tbody>
 </table>