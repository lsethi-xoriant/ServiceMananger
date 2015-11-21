
  module ReusableMethods
    def checking_ids(arrDb,arrParam)
        isExist=false
        arrParam.each do |v|
          isExist=false
          arrDb.each do |base|
            if v == base
              isExist = true
              break
            end
          end

          if !isExist
            raise CanCan::AccessDenied.new("One of the Id's is not yours")
          end
        end
        return isExist
    end


    def check_permissions(params)
      if [1,2].any? {|n| params.include? n }
        render json:{message: "Illegal permission for adding to a group"},status: 403
      end
    end

    def check_group_ids(params)
      ids = current_user.companies.includes(:stores).map { |company| company.groups.pluck(:id)}.flatten.uniq
      checking_ids(ids,params)
    end

    def check_store_ids(params)
      stores_ids = current_user.companies.includes(:stores).map { |company| company.stores.pluck(:id)}.flatten
      checking_ids(stores_ids,params)
    end


  end