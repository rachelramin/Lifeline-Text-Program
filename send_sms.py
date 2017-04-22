from twilio.rest import Client

account_sid = "REDACTED"
auth_token = "REDACTED"

client = Client(account_sid, auth_token)

message = client.messages.create(
    to="REDACTED",
    from_="REDACTED",
    body="It worked!")

print("This message was sent to the user successfully: " + message.body)
