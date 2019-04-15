<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://www.thymeleaf.org" xmlns:form="http://www.w3.org/1999/xhtml">

<head>
    <title>BookShelf</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous"></link>
    <link type="text/css" rel="stylesheet" href="../style.css" />

    <style>
        .pagination-centered {
            text-align: center;
        }

        .disabled {
            pointer-events: none;
            opacity: 0.5;
        }


        .pointer-disabled {
            pointer-events: none;
        }
    </style>

</head>
<body>
        <table class="container">
            <thead>
            <tr>
                <th style="text-align: center" width="15%">TITLE</th>
                <th style="text-align: center" width="42%">DESCRIPTION</th>
                <th style="text-align: center" width="10%">AUTHOR</th>
            </tr>
            </thead>
            <tbody>
            <tr th:each="book : ${booklist}">
                <td th:text="${book.title}"></td>
                <td th:text="${book.description}"></td>
                <td th:text="${book.author}"></td>
                <td>
                    <a style="color:#FB667A" th:href="@{'/take/'+${book.id}}">Take</a></br>
                    <a style="color:#FB667A" th:href="@{'/read/'+${book.id}}">Read</a></br>
                </td>
            </tr>
            <tr>
                <td>
                    <%--<div class="row">--%>
                        <%--<div th:if="${booklist.totalPages != 1} "--%>
                             <%--class="form-group col-md-11 pagination-centered" style="left: 25%">--%>
                            <%--<ul class="pagination">--%>
                                <%--<li th:class="${booklist.number == 0} ? disabled"><a--%>
                                        <%--class="pageLink"--%>
                                        <%--th:href="@{/(pageSize=${selectedPageSize}, page=1)}">«</a>--%>
                                <%--</li>--%>
                                <%--<li th:class="${booklist.number == 0} ? disabled"><a--%>
                                        <%--class="pageLink"--%>
                                        <%--th:href="@{/(pageSize=${selectedPageSize}, page=${booklist.number})}">←</a>--%>
                                <%--</li>--%>
                                <%--<li--%>
                                        <%--th:class="${booklist.number == (page - 1)} ? 'active pointer-disabled'"--%>
                                        <%--th:each="page : ${#numbers.sequence(pager.startPage, pager.endPage)}">--%>
                                    <%--<a class="pageLink"--%>
                                       <%--th:href="@{/(pageSize=${selectedPageSize}, page=${page})}"--%>
                                       <%--th:text="${page}"></a>--%>
                                <%--</li>--%>
                                <%--<li--%>
                                        <%--th:class="${booklist.number + 1 == booklist.totalPages} ? disabled">--%>
                                    <%--<a class="pageLink"--%>
                                       <%--th:href="@{/(pageSize=${selectedPageSize}, page=${booklist.number + 2})}">→</a>--%>
                                <%--</li>--%>
                                <%--<li--%>
                                        <%--th:class="${booklist.number + 1 == booklist.totalPages} ? disabled">--%>
                                    <%--<a class="pageLink"--%>
                                       <%--th:href="@{/(pageSize=${selectedPageSize}, page=${booklist.totalPages})}">»</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </td>
                <td colspan="5">
                    <form th:action="@{/find}" style="font-size: 14pt"  th:method="post">
                        <a style="color:#FB667A">Search for: </a>
                        <select  style="font-size: 14pt; color:#FB667A" right th:name="column">
                            <option value="title">title</option>
                            <option value="author">author</option>
                            <option value="year">print year</option>
                            <option value="isbn">ISBN</option>
                        </select>
                        <input style="font-size: 14pt; color:#FB667A" type="text" name="query">
                        <input style="font-size: 14pt; color:#FB667A" type="submit" value="Search">
                    </form>
                </td>
            </tr>
            </tbody>
        </table>

<script
        src="https://code.jquery.com/jquery-1.11.1.min.js"
        integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
        crossorigin="anonymous"></script>

<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
<script th:inline="javascript">
    /*<![CDATA[*/
    $(document).ready(function() {
        changePageAndSize();
    });

    function changePageAndSize() {
        $('#pageSizeSelect').change(function(evt) {
            window.location.replace("/?pageSize=" + this.value + "&page=1");
        });
    }
    /*]]>*/
</script>

</body>
</html>
