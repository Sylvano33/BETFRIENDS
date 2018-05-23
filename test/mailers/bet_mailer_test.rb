require 'test_helper'

class BetMailerTest < ActionMailer::TestCase
  test "newbet" do
    mail = BetMailer.newbet
    assert_equal "Newbet", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
