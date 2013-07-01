namespace :app_tasks do
  desc "create initial paper_trail version for existing records"
  task(:create_paper_trail_versions => :environment) do
    
    #MONKEY PATCH
    module PaperTrail
      module Model
        module InstanceMethods
          def create_initial_pt_version
            record_create if versions.blank?
            puts "created #{self.class} #{self.id}"
          end
        end
      end
    end 
    
    #UPDATE RECORDS
    ActiveRecord::Base.descendants.each do |model|
      if model.methods.include?(:paper_trail_enabled_for_model)
        model.all.each do |record|
          record.create_initial_pt_version
        end
      end
    end
  end
end