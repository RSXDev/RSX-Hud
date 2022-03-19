$("#barsContainer").fadeOut();

window.addEventListener('message', function(event) { 
    if (event.data.action == 'update') {

        if (event.data.health == 100) $("#health").fadeOut(); else $("#health").fadeIn();
        if (event.data.thirst > 50) $("#thirst").fadeOut(); else $("#thirst").fadeIn();
        if (event.data.hunger > 50) $("#hunger").fadeOut(); else $("#hunger").fadeIn();
        if (event.data.armour < 1) $("#armour").fadeOut(); else $("#armour").fadeIn();
        if (event.data.oxygen == 100) $("#lungs").fadeOut(); else $("#lungs").fadeIn();


        $('#health-bar').css('height', event.data.health + '%');
        $('#thirst-bar').css('height', event.data.thirst + '%');
        $('#hunger-bar').css('height', event.data.hunger + '%');
        $('#armour-bar').css('height', event.data.armour + '%');
        $('#lungs-bar').css('height', event.data.oxygen + '%');
    } else if (event.data.action == 'hideHud') {
        $("#barsContainer").fadeOut();
    }else if (event.data.action == 'showHud') {
        $("#barsContainer").fadeIn();
    }
});
