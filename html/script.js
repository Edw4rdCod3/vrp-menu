
$(function () {
    function display(bool) {
        if (bool) {
            $('.hide').show(100)
        } else {
            $('.hide').hide(100)
            $('.rules').hide(100)
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    $(document).on("click", ".minimap", function(event) {
        $.post(`https://${GetParentResourceName()}/map`, JSON.stringify({}));
        $('.hide').hide(100)
    })
    $(document).on("click", ".quit", function(event) {
        $.post(`https://${GetParentResourceName()}/quit`, JSON.stringify({}));
        $('.hide').hide(100)
    })
    $(document).on("click", ".resume", function(event) {
        $.post(`https://${GetParentResourceName()}/resume`, JSON.stringify({}));
        $('.hide').hide(100)
    })

    $(document).on("click", ".discord", function(event) {
        $.post(`https://${GetParentResourceName()}/discord`, JSON.stringify({}));
        window.invokeNative('openUrl', 'https://discord.gg/PnuxTqug');
      
    })
    $(document).on("click", ".settings", function(event) {
        $.post(`https://${GetParentResourceName()}/settings`, JSON.stringify({}));
        $('.hide').hide(100)
    })

})



window.addEventListener('message', function(event) {
    if (event.data.type === 'showAlert') {
        showAlert(event.data.message);
    }
});

function showAlert(message) {
    document.getElementById('alertMessage').innerText = message;
    document.getElementById('alertContainer').style.display = 'flex';
}

function closeAlert() {
    document.getElementById('alertContainer').style.display = 'none';
}

function sendBugReport() {
    const input = document.getElementById('bugInput').value;
    const webhookURL = 'YourWEbHOOK';

    if (input.trim() === '') {
        showAlert('Please enter a bug report.');
        return;
    }

    const payload = {
        content: `Bug Report: ${input}`
    };

    fetch(webhookURL, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(payload)
    })
    .then(response => {
        if (response.ok) {
            showAlert('Bug report sent successfully!');
            document.getElementById('bugInput').value = ''; // Clear the input field
        } else {
            showAlert('Failed to send bug report.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showAlert('Failed to send bug report.');
    });
}
