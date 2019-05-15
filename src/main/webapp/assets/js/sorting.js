
console.log("hello");
window.onload = function () {
    console.log("hello");
    var bookCL = document.getElementById("bookCL");
    var fromCL = document.getElementById("fromCL");
    var toCL = document.getElementById("toCL");
    var stateCL = document.getElementById("stateCL");
    var nameUL = document.getElementById("nameUL");
    var loginUL = document.getElementById("loginUL");
    var roleUL = document.getElementById("roleUL");
    var nameBL = document.getElementById("nameBL");
    var authorBL = document.getElementById("authorBL");
    var genreBL = document.getElementById("genreBL");
    var yearBL = document.getElementById("yearBL");
    if (bookCL) {
        bookCL.addEventListener("click", function() {
            sortTable(1,"userCard");
        });
    }
    if (fromCL) {
        fromCL.addEventListener("click", function() {
            sortTable(2,"userCard");
        });
    }
    if (toCL) {
        toCL.addEventListener("click", function() {
            sortTable(3,"userCard");
        });
    }
    if (stateCL) {
        stateCL.addEventListener("click", function() {
            sortTable(4,"userCard");
        });
    }
    if (nameUL) {
        nameUL.addEventListener("click", function() {
            sortTable(0,"userTable");
        });
    }
    if (loginUL) {
        loginUL.addEventListener("click", function() {
            sortTable(1,"userTable");
        });
    }
    if (roleUL) {
        roleUL.addEventListener("click", function() {
            sortTable(2,"userTable");
        });
    }
    if (nameBL) {
        nameBL.addEventListener("click", function() {
            sortTable(1,"bookList");
        });
    }
    if (authorBL) {
        authorBL.addEventListener("click", function() {
            sortTable(2,"bookList");
        });
    }
    if (genreBL) {
        genreBL.addEventListener("click", function() {
            sortTable(3,"bookList");
        });
    }
    if (yearBL) {
        yearBL.addEventListener("click", function() {
            sortTable(5,"bookList");
        });
    }
    function sortTable(n,name) {
        console.log("hello");
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById(name);
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                xi = x.innerHTML.toLowerCase().replace(/-/g, '');
                yi = y.innerHTML.toLowerCase().replace(/-/g, '');
                if (dir == "asc") {
                    if (xi > yi) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (xi < yi) {
                        shouldSwitch = true;
                        break;
                    }
                }}
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
};