$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..') unless $SETUP_LOADED
require 'unittests/setup'

class TC_JavaScript_Test < Test::Unit::TestCase
    
#    include FireWatir::Dialog
    
    def setup
        goto_page 'JavascriptClick.html'
    end
    
    tag_method :test_alert, :fails_on_ie
    def alert
        #browser.button(:id, "btnAlert").click_no_wait()

        #browser.click_jspopup_button("OK")
        browser.startClicker("ok", 1, '', "Press OK")
        browser.button(:id, "btnAlert").click

        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Alert button!")
        assert_equal("Press OK", browser.get_popup_text)
        
        browser.startClicker("ok")
        browser.button(:id, "btnAlert").click

        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Alert button!")
        assert_equal("Press OK", browser.get_popup_text)
    end
    
    tag_method :test_confirm_ok, :fails_on_ie
    def confirm_ok
        #browser.button(:id, "btnConfirm").click_no_wait()
        
        #browser.click_jspopup_button("OK")
        browser.startClicker("ok", 1, '', "Press a button")
        browser.button(:id, "btnConfirm").click

        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Confirm and OK button!")
        assert_equal("Press a button", browser.get_popup_text)

        browser.startClicker("ok")
        browser.button(:id, "btnConfirm").click

        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Confirm and OK button!")
        assert_equal("Press a button", browser.get_popup_text)
    end
    
    tag_method :test_confirm_cancel, :fails_on_ie
    def confirm_cancel
        #browser.button(:id, "btnConfirm").click_no_wait()
        
        #browser.click_jspopup_button("Cancel")
        browser.startClicker("cancel", 1, '', "Press a button")
        browser.button(:id, "btnConfirm").click

        assert_equal(browser.text_field(:id, "testResult").value, "You pressed the Confirm and Cancel button!")
        assert_equal("Press a button", browser.get_popup_text)

        browser.startClicker("cancel")
        browser.button(:id, "btnConfirm").click

        assert_equal(browser.text_field(:id, "testResult").value, "You pressed the Confirm and Cancel button!")
        assert_equal("Press a button", browser.get_popup_text)
    end

    tag_method :test_ok_selectbox, :fails_on_ie
    def test_ok_selectbox
        goto_page("selectboxes1.html")
        browser.startClicker("ok")
        browser.select_list(:id , "selectbox_5").select_value(/2/)

        assert_equal(browser.text_field(:id, "txtAlert").value , "You pressed OK button")
        assert_equal("Press OK", browser.get_popup_text)
    end
   
    def test_alert_new
        browser.button(:id, "btnAlert").click_no_wait()
        browser.click_jspopup_button("OK")
        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Alert button!")
    end
    
    def test_confirm_ok_new
        browser.button(:id, "btnConfirm").click_no_wait()
        browser.click_jspopup_button("ok")
        assert_equal(browser.text_field(:id, "testResult").value , "You pressed the Confirm and OK button!")
    end
    
    def test_confirm_cancel_new
        browser.button(:id, "btnConfirm").click_no_wait()
        browser.click_jspopup_button("cancel")
        assert_equal(browser.text_field(:id, "testResult").value, "You pressed the Confirm and Cancel button!")
    end
end
