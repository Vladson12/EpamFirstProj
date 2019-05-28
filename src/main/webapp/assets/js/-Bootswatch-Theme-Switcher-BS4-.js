$.getJSON("https://bootswatch.com/api/4.json", function (data) {
    var themes = data.themes;
    var select = $("#themeSelect");
    var link = $('link[href="/bootstrap/css/bootstrap.min.css"]');
    themes.forEach(function(value, index){
        select.append($("<option />")
            .val(index)
            .text(value.name));
    });
    select.change(function(){
        if($(this).val() === '100') {
            $(link).attr("href", '/bootstrap/css/bootstrap.min.css');
        } else {
            var theme = themes[$(this).val()];
            $(link).attr("href", theme.css);
            $(".themeName").text(theme.name);
        }
    });
}, "json");