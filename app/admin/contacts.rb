ActiveAdmin.register Contact do
permit_params :full_name,:email,:message,:contact_number, :country_code
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :email, :message, :contact_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :email, :message, :contact_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :email
      f.input :message
      f.input :contact_number
      f.input :country_code, as: :select, collection: [
        ['IN +91', '91'],
        ['AF +93', '93'],
        ['AUS/AU +61', '61'],
        ['AUT/AU +43', '43'],
        ['BH/BHR +973', '973'],
        ['BD/BGD +880', '880'],
        ['BE/BEL +32', '32'],
        ['BRA/BR +55', '55'],
        ['IS/ISL +354', '354'],
        ['ID/IDN +62', '62'],
        ['IM/IMN +44-1624', '44-1624'],
        ['BRN/BRN +673', '673'],
        ['BG/BGR +359', '359'],
        ['BF/BFA +226', '226'],
        ['BI/BDI +257', '257'],
        ['KH/KHM +855', '855'],
        ['CM/CMR +237', '237'],
        ['CA/CAN +1', '1'],
        ['CV/CPV +238', '238'],
        ['KY/CYM +1-345', '1-345'],
        ['CF/CAF +236', '236'],
        ['TD/TCD +235', '235'],
        ['CL/CHL +56', '56'],
        ['CN/CHN +86', '86'],
        ['CO/COL +57', '57'],
        ['KM/COM +269', '269'],
        ['CD/COD +243', '243'],
        ['CG/COG +242', '242'],
        ['CR/CRI +506', '506'],
        ['HR/HRV +385', '385'],
        ['CU/CUB +53', '53'],
        ['CY/CYP +357', '357'],
        ['CZ/CZE +420', '420'],
        ['DK/DNK +45', '45'],
        ['DJ/DJI +253', '253'],
        ['DM/DMA +1-767', '1-767'],
        ['DO/DOM +1-809, +1-829, +1-849', '1-809'],
        ['TL/TLS +670', '670'],
        ['EC/ECU +593', '593'],
        ['EG/EGY +20', '20'],
        ['SV/SLV +503', '503'],
        ['GQ/GNQ +240', '240'],
        ['ER/ERI +291', '291'],
        ['EE/EST +372', '372'],
        ['ET/ETH +251', '251'],
        ['FK/FLK +500', '500'],
        ['FO/FRO +298', '298'],
        ['FJ/FJI +679', '679'],
        ['FI/FIN +358', '358'],
        ['FR/FRA +33', '33'],
        ['GF/GUF +594', '594'],
        ['PF/PYF +689', '689'],
        ['GA/GAB +241', '241'],
        ['GM/GMB +220', '220']
      ]
      
    end
    f.actions
  end
  
end
