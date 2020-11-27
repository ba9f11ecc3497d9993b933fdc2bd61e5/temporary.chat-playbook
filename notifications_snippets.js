in print messages :
// works on google & firefox desktop, works on firefox mobile in the foreground


                    var title = src_user
                    var body = message;
                    const notification = new Notification(title, {body: body});




separate function:
// works on chrome desktop linux only

function register_service_worker() {
    // create a trustedScriptUrl within a policy for the service worker ScriptURL
    if (window.trustedTypes && trustedTypes.createPolicy) { 
        const sw = trustedTypes.createPolicy('sw', {
            createScriptURL: string => string
        }); 
        var safe_script_url = sw.createScriptURL('js/sw.js');
    }
    // register service worker
    if (navigator && navigator.serviceWorker) {
        navigator.serviceWorker
            .register(safe_script_url)
            .then((registration) => {
                console.log("ServiceWorker registered with scope:", registration.scope);
                    setTimeout(() => {
                        console.log("ServiceWorker is ready");
                        registration.showNotification('Vibration Sample', {
                            body: 'Buzz! Buzz!',
                            icon: 'tc.ico',
                            vibrate: [200, 100, 200, 100, 200, 100, 200],
                            tag: 'vibration-sample'
                        });
                    registration.update();
                    }, 100);
            })
            .catch((e) => console.error("ServiceWorker failed:", e));
    }
    else {
        alert("your browser does not support notifications")
    }
}
