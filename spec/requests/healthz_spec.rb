require "rails_helper"

RSpec.describe "GET /healthz", type: :request do
  it "returns 200 with a JSON ok status" do
    get "/healthz"

    expect(response).to have_http_status(:ok)
    expect(response.media_type).to eq("application/json")
    expect(JSON.parse(response.body)).to eq({ "status" => "ok" })
  end
end
