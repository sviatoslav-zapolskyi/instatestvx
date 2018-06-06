require 'instatestvx_client'

EMAIL = 'hello@world.com'
PASSWORD = 12345678

INCORRECT_PASSWORD_RESPONSE = {
  success: false,
  errors: {
    email: [""],
    password: [""],
    message: "The password and email you entered don't match. If you forgot your password, use \"Forgot Password\""
  }
}

module InstatestvxMe
  describe 'auth' do
    let(:instatestvx_client) do
      instatestvx_client = Client.new
      allow(instatestvx_client).to receive_message_chain("login.body") { INCORRECT_PASSWORD_RESPONSE }
      instatestvx_client
    end

    subject { instatestvx_client.login(EMAIL, PASSWORD).body }

    context 'incorrect password' do
      it('response with error') { is_expected.to eq INCORRECT_PASSWORD_RESPONSE }
    end
  end
end
