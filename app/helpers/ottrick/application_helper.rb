module Ottrick
  module ApplicationHelper
    include Wobapphelpers::Helpers::All

    def polymorphic_selector(form, poly, types)
      if types.any?
        # -- type selection
        msg = ""
        msg += form.input("#{poly}_type".to_sym, collection: types,
                 label_method: lambda {|x| t('activerecord.models.' + x.underscore)}
               )
        # -- object id selection
        collections = types.map {|t| t.constantize}
        msg += form.input(
                 "#{poly}_id".to_sym, collection: collections,
                 as: :grouped_select, group_method: :all
               )
        msg.html_safe
      end
    end

  end
end
