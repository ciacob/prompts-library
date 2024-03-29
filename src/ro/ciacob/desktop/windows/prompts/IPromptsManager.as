package ro.ciacob.desktop.windows.prompts {
import ro.ciacob.desktop.signals.IObserver;
import ro.ciacob.desktop.windows.IWindowsManager;

public interface IPromptsManager {

    /**
     * Hides all prompts currently shown, if any. This applies both to built-in, as well as custom
     * prompts.
     */
    function clear():void;

    /**
     * Produces the likely named, classical prompt. Default imagery and copy set at initialization time
     * will be used.
     *
     * @param    content
     *            The prompt's content.
     *
     * @param    title
     *            The prompt's title. Optional, defaults to specific values, e.g. "Alert".
     *
     * @param    width
     *            Optional, defaults to `500` logical pixels (can render to more physical pixels on high density
     *            screens). The width of the prompt window to use.
     *
     * @param  height
     *         Optional, defaults to `200` logical pixels (can render to more physical pixels on high density
     *         screens). The height of the prompt window to use.
     *
     * @return    An IObserver implementor's instance that will dispatch the USER_INTERACTION notification.
     *            One can register a callback to this notification to react based on which button user has
     *            clicked to dismiss the prompt (provided there are more of them). The callback will receive
     *            the name of the button as its lone argument. Use the constants in the AssetKeys class for
     *            the notification name and to compare returned button names with. The "X" button has its own
     *            constant too, as has the checkbox button, should there be one.
     */
    function alert(content:String, title:String = null, width:Number = 500, height:Number = 200):IObserver;

    /**
     * @see alert()
     */
    function confirmation(content:String, title:String = null, width:Number = 500, height:Number = 200):IObserver;

    /**
     * @see alert()
     */
    function yesNoConfirmation(content:String, title:String = null, width:Number = 500, height:Number = 200):IObserver;

    /**
     * @see alert()
     */
    function error(content:String, title:String = null, width:Number = 500, height:Number = 200):IObserver;

    /**
     * @see alert()
     */
    function information(content:String, title:String = null, width:Number = 500, height:Number = 200):IObserver;

    /**
     * Initializes the PromptsManager, connecting it with an available WindowsManager and providing it default
     * images and labels for the buttons.
     *
     * NOTE
     * There should not be multiple instances of PromptManagers, unless you plan to also have multiple
     * instances of WindowsManagers to respectively instantiate them with. Otherwise, they may present
     * erratic behavior, possibly overriding each other's commands.
     *
     * @param    windowsManager
     *            An instance of an WindowsManager, that will actually manipulate the resulting windows.
     *
     * @param    alertIcon
     * @param    confirmationIcon
     * @param    errorIcon
     * @param    informationIcon
     * @param    yesLabel
     * @param    noLabel
     * @param    okLabel
     * @param    cancelLabel
     *
     * @param    uiCallback
     *            Optional. Function to execute after initializing the UIComponent that
     *            will display the actual prompt. Will receive the UIComponent instance as
     *            argument
     *
     * @param    useNativeWindows
     *            Optional, default `false`. Whether to use the NATIVE style when creating
     *            windows, which has the host operating system producing the actual chrome for
     *            each window. If `false` (the default) a custom, Flex chrome will be provided,
     *            which is configurable via CSS. See the WindowsManager library documentation
     *            for details.
     */
    function init(
            windowsManager:IWindowsManager,
            alertIcon:Class = null,
            confirmationIcon:Class = null,
            errorIcon:Class = null,
            informationIcon:Class = null,
            yesLabel:String = null,
            noLabel:String = null,
            okLabel:String = null,
            cancelLabel:String = null,
            uiCallback:Function = null,
            useNativeWindows:Boolean = false
    ):void;


    /**
     * Produces a custom prompt.
     *
     * @param    content
     *            A string to use as the text content of the prompt. Can contain Flash HTML.
     *
     * @param    title
     *            The title to be shown by this prompt.
     *
     * @param    image
     *            A Class pointing to an embedded image, to use as the prompt's icon. Optional,
     *            defaults to null (no icon).
     *
     * @param    buttons
     *            A Vector of Strings, with labels for the buttons to show; for each string, a button
     *            will be created and displayed. Optional, defaults to null, which only displays the
     *            "OK" button. PAss an empty array to hide all buttons.
     *
     * @param    checkbox
     *            A string containing the label for a checkbox (typically, "don't show again").
     *            Optional, defaults to null, which shows no checkbox.
     *
     * @param    progressBar
     *            An IObserver implementor, that can dispatch a notification named
     *            "progressChanged", passing two or three arguments to the listening callback:
     *            the current value, the target value and an optional string to be used as a
     *            label. Optional, defaults to null, which shows no progress bar.
     *
     * @param    centerToMainWindow
     *            Optional flag to have created window automatically center in regard to the main
     *            window of the application.
     *
     * @param    width
     *            Optional, defaults to `500` logical pixels (can render to more physical pixels on high density
     *            screens). The width of the prompt window to use.
     *
     * @param  height
     *         Optional, defaults to `200` logical pixels (can render to more physical pixels on high density
     *         screens). The height of the prompt window to use.
     *
     * return    Returns an IObserver implementor, similarly to built-in prompts, read
     *            documentation for "alert()".
     *
     * @see alert
     */
    function prompt(
            content:String,
            title:String,
            image:Class = null,
            buttons:Vector.<String> = null,
            checkbox:String = null,
            progressBar:IObserver = null,
            centerToMainWindow:Boolean = true,
            width:Number = 500,
            height:Number = 200
    ):IObserver;
}
}
