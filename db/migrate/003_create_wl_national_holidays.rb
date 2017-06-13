class CreateWlNationalHolidays < ActiveRecord::Migration
  def change
    create_table  :wl_national_holidays do |t|
      t.date      :date_from,  :null => false
      t.date      :date_to,  :null => false
      t.string    :reason,  :null => false
    end
  end
end
