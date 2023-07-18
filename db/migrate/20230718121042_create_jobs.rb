class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :companyName
      t.string :jobType
      t.string :location
      t.boolean :remoteOK
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
