<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cinema</title>
    <style>
        h2 {
            padding: 10px 0;
            border-width: 0;
            border-radius: 1em;
            display: block;
            width: 1200px;
            height: 30px;
            margin: 200px auto 0;
            background: #60e6c5;
            color: black;
            font-size: 25px;
            outline: none;
            text-transform: uppercase;
            text-align: center;
        }
        .formAdd {
            padding: 5px 0;
            border-width: 0;
            border-radius: 1em;
            display: block;
            width: 1200px;
            height: 90px;
            margin: auto;
            background: #60e6c5;
            text-align: center;
            text-transform: uppercase;
            text-align: center;
        }

        table {
            margin: auto; /* Выравниваем таблицу по центру */
        }
        .tables {
            width: auto;
            border: none;
            margin: auto;
            border-collapse: separate;
            text-align: center;
        }
        .tables thead th {
            font-weight: bold;
            text-align: center;
            border: none;
            padding: 10px 15px;
            background: #EDEDED;
            font-size: 14px;
            border-top: 1px solid #ddd;
        }
        .tables tr th:first-child, .table tr td:first-child {
            border-left: 1px solid #ddd;
        }
        .tables tr th:last-child, .table tr td:last-child {
            border-right: 1px solid #ddd;
        }
        .tables thead tr th:first-child {
            border-radius: 20px 0 0 0;
        }
        .tables thead tr th:last-child {
            border-radius: 0 20px 0 0;
        }
        .tables tbody td {
            text-align: center;
            border: none;
            padding: 10px 15px;
            font-size: 14px;
            vertical-align: top;
        }
        .tables tbody tr:nth-child(even) {
            background: #F8F8F8;
        }
        .tables tbody tr:last-child td{
            border-bottom: 1px solid #ddd;
        }
        .tables tbody tr:last-child td:first-child {
            border-radius: 0 0 0 20px;
        }
        .tables tbody tr:last-child td:last-child {
            border-radius: 0 0 20px 0;
        }
    </style>
</head>
<body>

    <h2>Sessions list</h2>

    <div class="tables">
        <table width="1200">
            <thead>
            <tr>
                <th>Id</th>
                <th>Cost</th>
                <th>Time</th>
                <th>Movie</th>
                <th>Hall</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
        <tbody>
            <#list sessions as session>
            <tr>
                <td>${session.id}</td>
                <td>${session.cost}</td>
                <td>${session.date}</td>
                <td>${session.movie.title}</td>
                <td>Hall N ${session.hall.id}, ${session.hall.seats} seats</td>
                <td>
                    <form method="post" action="/admin/panel/sessions/update/${session.id}" name="session">
                        <input title="Cost" placeholder="Cost" type="text" name="cost" size="4" required pattern="^[0-9]+$">
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td><a href="/admin/panel/sessions/delete/${session.id}">delete</a></td>
            </tr>
            </#list>
        </tbody>
        </table>
    </div>
    <div class="formAdd">
    <form method="post" action="/admin/panel/sessions" name="session">
        <p><b>Add session</b><br><br>
        <input title="Cost" placeholder="Cost" type="text" name="cost" size="10" required pattern="^[0-9]+$">
        <input title="Time" type="datetime-local" name="date" size="10" required pattern="yyyy-MM-dd, HH:mm">
            <select title="Movie" name="movie">
                <#list movies as movie>
                    <option value="${movie.id}">
                        ${movie.title}</option>
                </#list>
            </select>
            <select title="Hall" name="hall">
                <#list halls as hall>
                    <option value="${hall.id}">
                        Hall N ${hall.id}, ${hall.seats} seats</option>
                </#list>
            </select>
        <button type="submit">Add session</button>
    </form>
    </div>
</body>
</html>
