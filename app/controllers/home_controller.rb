class HomeController < ApplicationController
  def index
    items = []
    temp = [] 
    heading = []         
    heading << "<b>email</b>" << "<b>Role</b>" << "<b>Created date</b>" << "<b>Dummy text</b>"      
    items << heading    
    User.all.map do |u|
      temp << u.email << u.role << u.created_at.to_s << 'like to generate pdf'
      items << temp
      temp = []
    end

    r = Receipts::Receipt.new(
      details: [
        ["Receipt Number", "123"],
        ["Date paid", Date.today],
        ["Payment method", "ACH super long super long super long super long super long"]
      ],
      company: {
        name: "Example, LLC",
        address: "123 Fake Street\nNew York City, NY 10012",
        email: "support@example.com",
        logo: File.expand_path("./app/assets/images/logo.png")
      },
      recipient: [
        "Customer",
        "Their Address",
        "City, State Zipcode",
        nil,
        "customer@example.org"
      ],      

      line_items: items,
      footer: "Thanks for your business. Please contact us if you have any questions."
    )    
    
    a = Time.now
    # Writes the PDF to disk
    r.render_file "public/pdf/#{a}.pdf"
    send_file(Rails.root.join('public', "pdf", "#{a}.pdf"))

  end
end
