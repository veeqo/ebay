
module Ebay
  module ApiMethods
    # Builds Ebay::Requests#AddDispute
    #
    # Returns Ebay::Responses#AddDispute
    #
    # Official Documentation for AddDispute[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddDispute.html]
    def add_dispute(params = {})
      commit(Ebay::Requests::AddDispute, params)
    end
    # Builds Ebay::Requests#AddDisputeResponse
    #
    # Returns Ebay::Responses#AddDisputeResponse
    #
    # Official Documentation for AddDisputeResponse[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddDisputeResponse.html]
    def add_dispute_response(params = {})
      commit(Ebay::Requests::AddDisputeResponse, params)
    end
    # Builds Ebay::Requests#AddFixedPriceItem
    #
    # Returns Ebay::Responses#AddFixedPriceItem
    #
    # Official Documentation for AddFixedPriceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddFixedPriceItem.html]
    def add_fixed_price_item(params = {})
      commit(Ebay::Requests::AddFixedPriceItem, params)
    end
    # Builds Ebay::Requests#AddItem
    #
    # Returns Ebay::Responses#AddItem
    #
    # Official Documentation for AddItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddItem.html]
    def add_item(params = {})
      commit(Ebay::Requests::AddItem, params)
    end
    # Builds Ebay::Requests#AddItems
    #
    # Returns Ebay::Responses#AddItems
    #
    # Official Documentation for AddItems[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddItems.html]
    def add_items(params = {})
      commit(Ebay::Requests::AddItems, params)
    end
    # Builds Ebay::Requests#AddMemberMessageAAQToPartner
    #
    # Returns Ebay::Responses#AddMemberMessageAAQToPartner
    #
    # Official Documentation for AddMemberMessageAAQToPartner[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddMemberMessageAAQToPartner.html]
    def add_member_message_aaq_to_partner(params = {})
      commit(Ebay::Requests::AddMemberMessageAAQToPartner, params)
    end
    # Builds Ebay::Requests#AddMemberMessageRTQ
    #
    # Returns Ebay::Responses#AddMemberMessageRTQ
    #
    # Official Documentation for AddMemberMessageRTQ[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddMemberMessageRTQ.html]
    def add_member_message_rtq(params = {})
      commit(Ebay::Requests::AddMemberMessageRTQ, params)
    end
    # Builds Ebay::Requests#AddMemberMessagesAAQToBidder
    #
    # Returns Ebay::Responses#AddMemberMessagesAAQToBidder
    #
    # Official Documentation for AddMemberMessagesAAQToBidder[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddMemberMessagesAAQToBidder.html]
    def add_member_messages_aaq_to_bidder(params = {})
      commit(Ebay::Requests::AddMemberMessagesAAQToBidder, params)
    end
    # Builds Ebay::Requests#AddOrder
    #
    # Returns Ebay::Responses#AddOrder
    #
    # Official Documentation for AddOrder[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddOrder.html]
    def add_order(params = {})
      commit(Ebay::Requests::AddOrder, params)
    end
    # Builds Ebay::Requests#AddSecondChanceItem
    #
    # Returns Ebay::Responses#AddSecondChanceItem
    #
    # Official Documentation for AddSecondChanceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddSecondChanceItem.html]
    def add_second_chance_item(params = {})
      commit(Ebay::Requests::AddSecondChanceItem, params)
    end
    # Builds Ebay::Requests#AddToItemDescription
    #
    # Returns Ebay::Responses#AddToItemDescription
    #
    # Official Documentation for AddToItemDescription[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddToItemDescription.html]
    def add_to_item_description(params = {})
      commit(Ebay::Requests::AddToItemDescription, params)
    end
    # Builds Ebay::Requests#AddToWatchList
    #
    # Returns Ebay::Responses#AddToWatchList
    #
    # Official Documentation for AddToWatchList[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddToWatchList.html]
    def add_to_watch_list(params = {})
      commit(Ebay::Requests::AddToWatchList, params)
    end
    # Builds Ebay::Requests#AddTransactionConfirmationItem
    #
    # Returns Ebay::Responses#AddTransactionConfirmationItem
    #
    # Official Documentation for AddTransactionConfirmationItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_AddTransactionConfirmationItem.html]
    def add_transaction_confirmation_item(params = {})
      commit(Ebay::Requests::AddTransactionConfirmationItem, params)
    end
    # Builds Ebay::Requests#CompleteSale
    #
    # Returns Ebay::Responses#CompleteSale
    #
    # Official Documentation for CompleteSale[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_CompleteSale.html]
    def complete_sale(params = {})
      commit(Ebay::Requests::CompleteSale, params)
    end
    # Builds Ebay::Requests#ConfirmIdentity
    #
    # Returns Ebay::Responses#ConfirmIdentity
    #
    # Official Documentation for ConfirmIdentity[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ConfirmIdentity.html]
    def confirm_identity(params = {})
      commit(Ebay::Requests::ConfirmIdentity, params)
    end
    # Builds Ebay::Requests#DeleteMyMessages
    #
    # Returns Ebay::Responses#DeleteMyMessages
    #
    # Official Documentation for DeleteMyMessages[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_DeleteMyMessages.html]
    def delete_my_messages(params = {})
      commit(Ebay::Requests::DeleteMyMessages, params)
    end
    # Builds Ebay::Requests#DisableUnpaidItemAssistance
    #
    # Returns Ebay::Responses#DisableUnpaidItemAssistance
    #
    # Official Documentation for DisableUnpaidItemAssistance[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_DisableUnpaidItemAssistance.html]
    def disable_unpaid_item_assistance(params = {})
      commit(Ebay::Requests::DisableUnpaidItemAssistance, params)
    end
    # Builds Ebay::Requests#EndFixedPriceItem
    #
    # Returns Ebay::Responses#EndFixedPriceItem
    #
    # Official Documentation for EndFixedPriceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_EndFixedPriceItem.html]
    def end_fixed_price_item(params = {})
      commit(Ebay::Requests::EndFixedPriceItem, params)
    end
    # Builds Ebay::Requests#EndItem
    #
    # Returns Ebay::Responses#EndItem
    #
    # Official Documentation for EndItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_EndItem.html]
    def end_item(params = {})
      commit(Ebay::Requests::EndItem, params)
    end
    # Builds Ebay::Requests#EndItems
    #
    # Returns Ebay::Responses#EndItems
    #
    # Official Documentation for EndItems[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_EndItems.html]
    def end_items(params = {})
      commit(Ebay::Requests::EndItems, params)
    end
    # Builds Ebay::Requests#ExtendSiteHostedPictures
    #
    # Returns Ebay::Responses#ExtendSiteHostedPictures
    #
    # Official Documentation for ExtendSiteHostedPictures[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ExtendSiteHostedPictures.html]
    def extend_site_hosted_pictures(params = {})
      commit(Ebay::Requests::ExtendSiteHostedPictures, params)
    end
    # Builds Ebay::Requests#FetchToken
    #
    # Returns Ebay::Responses#FetchToken
    #
    # Official Documentation for FetchToken[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_FetchToken.html]
    def fetch_token(params = {})
      commit(Ebay::Requests::FetchToken, params)
    end
    # Builds Ebay::Requests#GetAccount
    #
    # Returns Ebay::Responses#GetAccount
    #
    # Official Documentation for GetAccount[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetAccount.html]
    def get_account(params = {})
      commit(Ebay::Requests::GetAccount, params)
    end
    # Builds Ebay::Requests#GetAdFormatLeads
    #
    # Returns Ebay::Responses#GetAdFormatLeads
    #
    # Official Documentation for GetAdFormatLeads[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetAdFormatLeads.html]
    def get_ad_format_leads(params = {})
      commit(Ebay::Requests::GetAdFormatLeads, params)
    end
    # Builds Ebay::Requests#GetAllBidders
    #
    # Returns Ebay::Responses#GetAllBidders
    #
    # Official Documentation for GetAllBidders[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetAllBidders.html]
    def get_all_bidders(params = {})
      commit(Ebay::Requests::GetAllBidders, params)
    end
    # Builds Ebay::Requests#GetApiAccessRules
    #
    # Returns Ebay::Responses#GetApiAccessRules
    #
    # Official Documentation for GetApiAccessRules[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetApiAccessRules.html]
    def get_api_access_rules(params = {})
      commit(Ebay::Requests::GetApiAccessRules, params)
    end
    # Builds Ebay::Requests#GetBestOffers
    #
    # Returns Ebay::Responses#GetBestOffers
    #
    # Official Documentation for GetBestOffers[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetBestOffers.html]
    def get_best_offers(params = {})
      commit(Ebay::Requests::GetBestOffers, params)
    end
    # Builds Ebay::Requests#GetBidderList
    #
    # Returns Ebay::Responses#GetBidderList
    #
    # Official Documentation for GetBidderList[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetBidderList.html]
    def get_bidder_list(params = {})
      commit(Ebay::Requests::GetBidderList, params)
    end
    # Builds Ebay::Requests#GetCategories
    #
    # Returns Ebay::Responses#GetCategories
    #
    # Official Documentation for GetCategories[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetCategories.html]
    def get_categories(params = {})
      commit(Ebay::Requests::GetCategories, params)
    end
    # Builds Ebay::Requests#GetCategoryFeatures
    #
    # Returns Ebay::Responses#GetCategoryFeatures
    #
    # Official Documentation for GetCategoryFeatures[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetCategoryFeatures.html]
    def get_category_features(params = {})
      commit(Ebay::Requests::GetCategoryFeatures, params)
    end
    # Builds Ebay::Requests#GetCategoryMappings
    #
    # Returns Ebay::Responses#GetCategoryMappings
    #
    # Official Documentation for GetCategoryMappings[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetCategoryMappings.html]
    def get_category_mappings(params = {})
      commit(Ebay::Requests::GetCategoryMappings, params)
    end
    # Builds Ebay::Requests#GetCategorySpecifics
    #
    # Returns Ebay::Responses#GetCategorySpecifics
    #
    # Official Documentation for GetCategorySpecifics[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetCategorySpecifics.html]
    def get_category_specifics(params = {})
      commit(Ebay::Requests::GetCategorySpecifics, params)
    end
    # Builds Ebay::Requests#GetChallengeToken
    #
    # Returns Ebay::Responses#GetChallengeToken
    #
    # Official Documentation for GetChallengeToken[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetChallengeToken.html]
    def get_challenge_token(params = {})
      commit(Ebay::Requests::GetChallengeToken, params)
    end
    # Builds Ebay::Requests#GetCharities
    #
    # Returns Ebay::Responses#GetCharities
    #
    # Official Documentation for GetCharities[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetCharities.html]
    def get_charities(params = {})
      commit(Ebay::Requests::GetCharities, params)
    end
    # Builds Ebay::Requests#GetClientAlertsAuthToken
    #
    # Returns Ebay::Responses#GetClientAlertsAuthToken
    #
    # Official Documentation for GetClientAlertsAuthToken[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetClientAlertsAuthToken.html]
    def get_client_alerts_auth_token(params = {})
      commit(Ebay::Requests::GetClientAlertsAuthToken, params)
    end
    # Builds Ebay::Requests#GetContextualKeywords
    #
    # Returns Ebay::Responses#GetContextualKeywords
    #
    # Official Documentation for GetContextualKeywords[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetContextualKeywords.html]
    def get_contextual_keywords(params = {})
      commit(Ebay::Requests::GetContextualKeywords, params)
    end
    # Builds Ebay::Requests#GetDescriptionTemplates
    #
    # Returns Ebay::Responses#GetDescriptionTemplates
    #
    # Official Documentation for GetDescriptionTemplates[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetDescriptionTemplates.html]
    def get_description_templates(params = {})
      commit(Ebay::Requests::GetDescriptionTemplates, params)
    end
    # Builds Ebay::Requests#GetDispute
    #
    # Returns Ebay::Responses#GetDispute
    #
    # Official Documentation for GetDispute[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetDispute.html]
    def get_dispute(params = {})
      commit(Ebay::Requests::GetDispute, params)
    end
    # Builds Ebay::Requests#GetFeedback
    #
    # Returns Ebay::Responses#GetFeedback
    #
    # Official Documentation for GetFeedback[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetFeedback.html]
    def get_feedback(params = {})
      commit(Ebay::Requests::GetFeedback, params)
    end
    # Builds Ebay::Requests#GetItem
    #
    # Returns Ebay::Responses#GetItem
    #
    # Official Documentation for GetItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetItem.html]
    def get_item(params = {})
      commit(Ebay::Requests::GetItem, params)
    end
    # Builds Ebay::Requests#GetItemShipping
    #
    # Returns Ebay::Responses#GetItemShipping
    #
    # Official Documentation for GetItemShipping[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetItemShipping.html]
    def get_item_shipping(params = {})
      commit(Ebay::Requests::GetItemShipping, params)
    end
    # Builds Ebay::Requests#GetItemTransactions
    #
    # Returns Ebay::Responses#GetItemTransactions
    #
    # Official Documentation for GetItemTransactions[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetItemTransactions.html]
    def get_item_transactions(params = {})
      commit(Ebay::Requests::GetItemTransactions, params)
    end
    # Builds Ebay::Requests#GetItemsAwaitingFeedback
    #
    # Returns Ebay::Responses#GetItemsAwaitingFeedback
    #
    # Official Documentation for GetItemsAwaitingFeedback[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetItemsAwaitingFeedback.html]
    def get_items_awaiting_feedback(params = {})
      commit(Ebay::Requests::GetItemsAwaitingFeedback, params)
    end
    # Builds Ebay::Requests#GetMemberMessages
    #
    # Returns Ebay::Responses#GetMemberMessages
    #
    # Official Documentation for GetMemberMessages[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMemberMessages.html]
    def get_member_messages(params = {})
      commit(Ebay::Requests::GetMemberMessages, params)
    end
    # Builds Ebay::Requests#GetMessagePreferences
    #
    # Returns Ebay::Responses#GetMessagePreferences
    #
    # Official Documentation for GetMessagePreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMessagePreferences.html]
    def get_message_preferences(params = {})
      commit(Ebay::Requests::GetMessagePreferences, params)
    end
    # Builds Ebay::Requests#GetMyMessages
    #
    # Returns Ebay::Responses#GetMyMessages
    #
    # Official Documentation for GetMyMessages[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMyMessages.html]
    def get_my_messages(params = {})
      commit(Ebay::Requests::GetMyMessages, params)
    end
    # Builds Ebay::Requests#GetMyeBayBuying
    #
    # Returns Ebay::Responses#GetMyeBayBuying
    #
    # Official Documentation for GetMyeBayBuying[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMyeBayBuying.html]
    def get_my_ebay_buying(params = {})
      commit(Ebay::Requests::GetMyeBayBuying, params)
    end
    # Builds Ebay::Requests#GetMyeBayReminders
    #
    # Returns Ebay::Responses#GetMyeBayReminders
    #
    # Official Documentation for GetMyeBayReminders[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMyeBayReminders.html]
    def get_my_ebay_reminders(params = {})
      commit(Ebay::Requests::GetMyeBayReminders, params)
    end
    # Builds Ebay::Requests#GetMyeBaySelling
    #
    # Returns Ebay::Responses#GetMyeBaySelling
    #
    # Official Documentation for GetMyeBaySelling[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetMyeBaySelling.html]
    def get_my_ebay_selling(params = {})
      commit(Ebay::Requests::GetMyeBaySelling, params)
    end
    # Builds Ebay::Requests#GetNotificationPreferences
    #
    # Returns Ebay::Responses#GetNotificationPreferences
    #
    # Official Documentation for GetNotificationPreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetNotificationPreferences.html]
    def get_notification_preferences(params = {})
      commit(Ebay::Requests::GetNotificationPreferences, params)
    end
    # Builds Ebay::Requests#GetNotificationsUsage
    #
    # Returns Ebay::Responses#GetNotificationsUsage
    #
    # Official Documentation for GetNotificationsUsage[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetNotificationsUsage.html]
    def get_notifications_usage(params = {})
      commit(Ebay::Requests::GetNotificationsUsage, params)
    end
    # Builds Ebay::Requests#GetOrderTransactions
    #
    # Returns Ebay::Responses#GetOrderTransactions
    #
    # Official Documentation for GetOrderTransactions[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetOrderTransactions.html]
    def get_order_transactions(params = {})
      commit(Ebay::Requests::GetOrderTransactions, params)
    end
    # Builds Ebay::Requests#GetOrders
    #
    # Returns Ebay::Responses#GetOrders
    #
    # Official Documentation for GetOrders[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetOrders.html]
    def get_orders(params = {})
      commit(Ebay::Requests::GetOrders, params)
    end
    # Builds Ebay::Requests#GetSellerDashboard
    #
    # Returns Ebay::Responses#GetSellerDashboard
    #
    # Official Documentation for GetSellerDashboard[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSellerDashboard.html]
    def get_seller_dashboard(params = {})
      commit(Ebay::Requests::GetSellerDashboard, params)
    end
    # Builds Ebay::Requests#GetSellerEvents
    #
    # Returns Ebay::Responses#GetSellerEvents
    #
    # Official Documentation for GetSellerEvents[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSellerEvents.html]
    def get_seller_events(params = {})
      commit(Ebay::Requests::GetSellerEvents, params)
    end
    # Builds Ebay::Requests#GetSellerList
    #
    # Returns Ebay::Responses#GetSellerList
    #
    # Official Documentation for GetSellerList[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSellerList.html]
    def get_seller_list(params = {})
      commit(Ebay::Requests::GetSellerList, params)
    end
    # Builds Ebay::Requests#GetSellerTransactions
    #
    # Returns Ebay::Responses#GetSellerTransactions
    #
    # Official Documentation for GetSellerTransactions[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSellerTransactions.html]
    def get_seller_transactions(params = {})
      commit(Ebay::Requests::GetSellerTransactions, params)
    end
    # Builds Ebay::Requests#GetSessionID
    #
    # Returns Ebay::Responses#GetSessionID
    #
    # Official Documentation for GetSessionID[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSessionID.html]
    def get_session_id(params = {})
      commit(Ebay::Requests::GetSessionID, params)
    end
    # Builds Ebay::Requests#GetShippingDiscountProfiles
    #
    # Returns Ebay::Responses#GetShippingDiscountProfiles
    #
    # Official Documentation for GetShippingDiscountProfiles[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetShippingDiscountProfiles.html]
    def get_shipping_discount_profiles(params = {})
      commit(Ebay::Requests::GetShippingDiscountProfiles, params)
    end
    # Builds Ebay::Requests#GetStore
    #
    # Returns Ebay::Responses#GetStore
    #
    # Official Documentation for GetStore[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetStore.html]
    def get_store(params = {})
      commit(Ebay::Requests::GetStore, params)
    end
    # Builds Ebay::Requests#GetStoreCategoryUpdateStatus
    #
    # Returns Ebay::Responses#GetStoreCategoryUpdateStatus
    #
    # Official Documentation for GetStoreCategoryUpdateStatus[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetStoreCategoryUpdateStatus.html]
    def get_store_category_update_status(params = {})
      commit(Ebay::Requests::GetStoreCategoryUpdateStatus, params)
    end
    # Builds Ebay::Requests#GetStoreCustomPage
    #
    # Returns Ebay::Responses#GetStoreCustomPage
    #
    # Official Documentation for GetStoreCustomPage[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetStoreCustomPage.html]
    def get_store_custom_page(params = {})
      commit(Ebay::Requests::GetStoreCustomPage, params)
    end
    # Builds Ebay::Requests#GetStoreOptions
    #
    # Returns Ebay::Responses#GetStoreOptions
    #
    # Official Documentation for GetStoreOptions[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetStoreOptions.html]
    def get_store_options(params = {})
      commit(Ebay::Requests::GetStoreOptions, params)
    end
    # Builds Ebay::Requests#GetStorePreferences
    #
    # Returns Ebay::Responses#GetStorePreferences
    #
    # Official Documentation for GetStorePreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetStorePreferences.html]
    def get_store_preferences(params = {})
      commit(Ebay::Requests::GetStorePreferences, params)
    end
    # Builds Ebay::Requests#GetSuggestedCategories
    #
    # Returns Ebay::Responses#GetSuggestedCategories
    #
    # Official Documentation for GetSuggestedCategories[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetSuggestedCategories.html]
    def get_suggested_categories(params = {})
      commit(Ebay::Requests::GetSuggestedCategories, params)
    end
    # Builds Ebay::Requests#GetTaxTable
    #
    # Returns Ebay::Responses#GetTaxTable
    #
    # Official Documentation for GetTaxTable[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetTaxTable.html]
    def get_tax_table(params = {})
      commit(Ebay::Requests::GetTaxTable, params)
    end
    # Builds Ebay::Requests#GetTokenStatus
    #
    # Returns Ebay::Responses#GetTokenStatus
    #
    # Official Documentation for GetTokenStatus[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetTokenStatus.html]
    def get_token_status(params = {})
      commit(Ebay::Requests::GetTokenStatus, params)
    end
    # Builds Ebay::Requests#GetUser
    #
    # Returns Ebay::Responses#GetUser
    #
    # Official Documentation for GetUser[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetUser.html]
    def get_user(params = {})
      commit(Ebay::Requests::GetUser, params)
    end
    # Builds Ebay::Requests#GetUserContactDetails
    #
    # Returns Ebay::Responses#GetUserContactDetails
    #
    # Official Documentation for GetUserContactDetails[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetUserContactDetails.html]
    def get_user_contact_details(params = {})
      commit(Ebay::Requests::GetUserContactDetails, params)
    end
    # Builds Ebay::Requests#GetUserDisputes
    #
    # Returns Ebay::Responses#GetUserDisputes
    #
    # Official Documentation for GetUserDisputes[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetUserDisputes.html]
    def get_user_disputes(params = {})
      commit(Ebay::Requests::GetUserDisputes, params)
    end
    # Builds Ebay::Requests#GetUserPreferences
    #
    # Returns Ebay::Responses#GetUserPreferences
    #
    # Official Documentation for GetUserPreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetUserPreferences.html]
    def get_user_preferences(params = {})
      commit(Ebay::Requests::GetUserPreferences, params)
    end
    # Builds Ebay::Requests#GetVeROReasonCodeDetails
    #
    # Returns Ebay::Responses#GetVeROReasonCodeDetails
    #
    # Official Documentation for GetVeROReasonCodeDetails[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetVeROReasonCodeDetails.html]
    def get_vero_reason_code_details(params = {})
      commit(Ebay::Requests::GetVeROReasonCodeDetails, params)
    end
    # Builds Ebay::Requests#GetVeROReportStatus
    #
    # Returns Ebay::Responses#GetVeROReportStatus
    #
    # Official Documentation for GetVeROReportStatus[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GetVeROReportStatus.html]
    def get_vero_report_status(params = {})
      commit(Ebay::Requests::GetVeROReportStatus, params)
    end
    # Builds Ebay::Requests#GeteBayDetails
    #
    # Returns Ebay::Responses#GeteBayDetails
    #
    # Official Documentation for GeteBayDetails[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GeteBayDetails.html]
    def get_ebay_details(params = {})
      commit(Ebay::Requests::GeteBayDetails, params)
    end
    # Builds Ebay::Requests#GeteBayOfficialTime
    #
    # Returns Ebay::Responses#GeteBayOfficialTime
    #
    # Official Documentation for GeteBayOfficialTime[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_GeteBayOfficialTime.html]
    def get_ebay_official_time(params = {})
      commit(Ebay::Requests::GeteBayOfficialTime, params)
    end
    # Builds Ebay::Requests#LeaveFeedback
    #
    # Returns Ebay::Responses#LeaveFeedback
    #
    # Official Documentation for LeaveFeedback[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_LeaveFeedback.html]
    def leave_feedback(params = {})
      commit(Ebay::Requests::LeaveFeedback, params)
    end
    # Builds Ebay::Requests#PlaceOffer
    #
    # Returns Ebay::Responses#PlaceOffer
    #
    # Official Documentation for PlaceOffer[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_PlaceOffer.html]
    def place_offer(params = {})
      commit(Ebay::Requests::PlaceOffer, params)
    end
    # Builds Ebay::Requests#RelistFixedPriceItem
    #
    # Returns Ebay::Responses#RelistFixedPriceItem
    #
    # Official Documentation for RelistFixedPriceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RelistFixedPriceItem.html]
    def relist_fixed_price_item(params = {})
      commit(Ebay::Requests::RelistFixedPriceItem, params)
    end
    # Builds Ebay::Requests#RelistItem
    #
    # Returns Ebay::Responses#RelistItem
    #
    # Official Documentation for RelistItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RelistItem.html]
    def relist_item(params = {})
      commit(Ebay::Requests::RelistItem, params)
    end
    # Builds Ebay::Requests#RemoveFromWatchList
    #
    # Returns Ebay::Responses#RemoveFromWatchList
    #
    # Official Documentation for RemoveFromWatchList[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RemoveFromWatchList.html]
    def remove_from_watch_list(params = {})
      commit(Ebay::Requests::RemoveFromWatchList, params)
    end
    # Builds Ebay::Requests#RespondToBestOffer
    #
    # Returns Ebay::Responses#RespondToBestOffer
    #
    # Official Documentation for RespondToBestOffer[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RespondToBestOffer.html]
    def respond_to_best_offer(params = {})
      commit(Ebay::Requests::RespondToBestOffer, params)
    end
    # Builds Ebay::Requests#RespondToFeedback
    #
    # Returns Ebay::Responses#RespondToFeedback
    #
    # Official Documentation for RespondToFeedback[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RespondToFeedback.html]
    def respond_to_feedback(params = {})
      commit(Ebay::Requests::RespondToFeedback, params)
    end
    # Builds Ebay::Requests#ReviseCheckoutStatus
    #
    # Returns Ebay::Responses#ReviseCheckoutStatus
    #
    # Official Documentation for ReviseCheckoutStatus[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseCheckoutStatus.html]
    def revise_checkout_status(params = {})
      commit(Ebay::Requests::ReviseCheckoutStatus, params)
    end
    # Builds Ebay::Requests#ReviseFixedPriceItem
    #
    # Returns Ebay::Responses#ReviseFixedPriceItem
    #
    # Official Documentation for ReviseFixedPriceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseFixedPriceItem.html]
    def revise_fixed_price_item(params = {})
      commit(Ebay::Requests::ReviseFixedPriceItem, params)
    end
    # Builds Ebay::Requests#ReviseInventoryStatus
    #
    # Returns Ebay::Responses#ReviseInventoryStatus
    #
    # Official Documentation for ReviseInventoryStatus[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseInventoryStatus.html]
    def revise_inventory_status(params = {})
      commit(Ebay::Requests::ReviseInventoryStatus, params)
    end
    # Builds Ebay::Requests#ReviseItem
    #
    # Returns Ebay::Responses#ReviseItem
    #
    # Official Documentation for ReviseItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseItem.html]
    def revise_item(params = {})
      commit(Ebay::Requests::ReviseItem, params)
    end
    # Builds Ebay::Requests#ReviseMyMessages
    #
    # Returns Ebay::Responses#ReviseMyMessages
    #
    # Official Documentation for ReviseMyMessages[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseMyMessages.html]
    def revise_my_messages(params = {})
      commit(Ebay::Requests::ReviseMyMessages, params)
    end
    # Builds Ebay::Requests#ReviseMyMessagesFolders
    #
    # Returns Ebay::Responses#ReviseMyMessagesFolders
    #
    # Official Documentation for ReviseMyMessagesFolders[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ReviseMyMessagesFolders.html]
    def revise_my_messages_folders(params = {})
      commit(Ebay::Requests::ReviseMyMessagesFolders, params)
    end
    # Builds Ebay::Requests#RevokeToken
    #
    # Returns Ebay::Responses#RevokeToken
    #
    # Official Documentation for RevokeToken[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_RevokeToken.html]
    def revoke_token(params = {})
      commit(Ebay::Requests::RevokeToken, params)
    end
    # Builds Ebay::Requests#SellerReverseDispute
    #
    # Returns Ebay::Responses#SellerReverseDispute
    #
    # Official Documentation for SellerReverseDispute[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SellerReverseDispute.html]
    def seller_reverse_dispute(params = {})
      commit(Ebay::Requests::SellerReverseDispute, params)
    end
    # Builds Ebay::Requests#SendInvoice
    #
    # Returns Ebay::Responses#SendInvoice
    #
    # Official Documentation for SendInvoice[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SendInvoice.html]
    def send_invoice(params = {})
      commit(Ebay::Requests::SendInvoice, params)
    end
    # Builds Ebay::Requests#SetMessagePreferences
    #
    # Returns Ebay::Responses#SetMessagePreferences
    #
    # Official Documentation for SetMessagePreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetMessagePreferences.html]
    def set_message_preferences(params = {})
      commit(Ebay::Requests::SetMessagePreferences, params)
    end
    # Builds Ebay::Requests#SetNotificationPreferences
    #
    # Returns Ebay::Responses#SetNotificationPreferences
    #
    # Official Documentation for SetNotificationPreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetNotificationPreferences.html]
    def set_notification_preferences(params = {})
      commit(Ebay::Requests::SetNotificationPreferences, params)
    end
    # Builds Ebay::Requests#SetShippingDiscountProfiles
    #
    # Returns Ebay::Responses#SetShippingDiscountProfiles
    #
    # Official Documentation for SetShippingDiscountProfiles[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetShippingDiscountProfiles.html]
    def set_shipping_discount_profiles(params = {})
      commit(Ebay::Requests::SetShippingDiscountProfiles, params)
    end
    # Builds Ebay::Requests#SetStore
    #
    # Returns Ebay::Responses#SetStore
    #
    # Official Documentation for SetStore[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetStore.html]
    def set_store(params = {})
      commit(Ebay::Requests::SetStore, params)
    end
    # Builds Ebay::Requests#SetStoreCategories
    #
    # Returns Ebay::Responses#SetStoreCategories
    #
    # Official Documentation for SetStoreCategories[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetStoreCategories.html]
    def set_store_categories(params = {})
      commit(Ebay::Requests::SetStoreCategories, params)
    end
    # Builds Ebay::Requests#SetStoreCustomPage
    #
    # Returns Ebay::Responses#SetStoreCustomPage
    #
    # Official Documentation for SetStoreCustomPage[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetStoreCustomPage.html]
    def set_store_custom_page(params = {})
      commit(Ebay::Requests::SetStoreCustomPage, params)
    end
    # Builds Ebay::Requests#SetStorePreferences
    #
    # Returns Ebay::Responses#SetStorePreferences
    #
    # Official Documentation for SetStorePreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetStorePreferences.html]
    def set_store_preferences(params = {})
      commit(Ebay::Requests::SetStorePreferences, params)
    end
    # Builds Ebay::Requests#SetTaxTable
    #
    # Returns Ebay::Responses#SetTaxTable
    #
    # Official Documentation for SetTaxTable[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetTaxTable.html]
    def set_tax_table(params = {})
      commit(Ebay::Requests::SetTaxTable, params)
    end
    # Builds Ebay::Requests#SetUserNotes
    #
    # Returns Ebay::Responses#SetUserNotes
    #
    # Official Documentation for SetUserNotes[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetUserNotes.html]
    def set_user_notes(params = {})
      commit(Ebay::Requests::SetUserNotes, params)
    end
    # Builds Ebay::Requests#SetUserPreferences
    #
    # Returns Ebay::Responses#SetUserPreferences
    #
    # Official Documentation for SetUserPreferences[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_SetUserPreferences.html]
    def set_user_preferences(params = {})
      commit(Ebay::Requests::SetUserPreferences, params)
    end
    # Builds Ebay::Requests#UploadSiteHostedPictures
    #
    # Returns Ebay::Responses#UploadSiteHostedPictures
    #
    # Official Documentation for UploadSiteHostedPictures[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_UploadSiteHostedPictures.html]
    def upload_site_hosted_pictures(params = {})
      commit(Ebay::Requests::UploadSiteHostedPictures, params)
    end
    # Builds Ebay::Requests#ValidateChallengeInput
    #
    # Returns Ebay::Responses#ValidateChallengeInput
    #
    # Official Documentation for ValidateChallengeInput[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ValidateChallengeInput.html]
    def validate_challenge_input(params = {})
      commit(Ebay::Requests::ValidateChallengeInput, params)
    end
    # Builds Ebay::Requests#ValidateTestUserRegistration
    #
    # Returns Ebay::Responses#ValidateTestUserRegistration
    #
    # Official Documentation for ValidateTestUserRegistration[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_ValidateTestUserRegistration.html]
    def validate_test_user_registration(params = {})
      commit(Ebay::Requests::ValidateTestUserRegistration, params)
    end
    # Builds Ebay::Requests#VeROReportItems
    #
    # Returns Ebay::Responses#VeROReportItems
    #
    # Official Documentation for VeROReportItems[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_VeROReportItems.html]
    def vero_report_items(params = {})
      commit(Ebay::Requests::VeROReportItems, params)
    end
    # Builds Ebay::Requests#VerifyAddFixedPriceItem
    #
    # Returns Ebay::Responses#VerifyAddFixedPriceItem
    #
    # Official Documentation for VerifyAddFixedPriceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_VerifyAddFixedPriceItem.html]
    def verify_add_fixed_price_item(params = {})
      commit(Ebay::Requests::VerifyAddFixedPriceItem, params)
    end
    # Builds Ebay::Requests#VerifyAddItem
    #
    # Returns Ebay::Responses#VerifyAddItem
    #
    # Official Documentation for VerifyAddItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_VerifyAddItem.html]
    def verify_add_item(params = {})
      commit(Ebay::Requests::VerifyAddItem, params)
    end
    # Builds Ebay::Requests#VerifyAddSecondChanceItem
    #
    # Returns Ebay::Responses#VerifyAddSecondChanceItem
    #
    # Official Documentation for VerifyAddSecondChanceItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_VerifyAddSecondChanceItem.html]
    def verify_add_second_chance_item(params = {})
      commit(Ebay::Requests::VerifyAddSecondChanceItem, params)
    end
    # Builds Ebay::Requests#VerifyRelistItem
    #
    # Returns Ebay::Responses#VerifyRelistItem
    #
    # Official Documentation for VerifyRelistItem[http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/io_VerifyRelistItem.html]
    def verify_relist_item(params = {})
      commit(Ebay::Requests::VerifyRelistItem, params)
    end
  end
end
