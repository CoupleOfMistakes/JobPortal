class AddPhoneNumberAndUrlToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :phoneNumber, :string
    add_column :jobs, :url, :string
  end
end