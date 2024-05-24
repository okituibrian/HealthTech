//model for household details
class HouseholdDetailsFormData{
  String? householdNumber;
  String nationality = '';
  String county = '';
  String subCounty = '';
  String constituency = '';
  String ward = '';
  String communityUnit = '';
  String householdSize = '';
  String numberOfUnderFive = '';

  Map<String, dynamic> toJson() {
    return {
      'householdNumber': householdNumber ?? '',
      'nationality': nationality,
      'county': county,
      'subCounty': subCounty,
      'constituency': constituency,
      'ward': ward,
      'communityUnit': communityUnit,
      'householdSize': householdSize,
      'numberOfUnderFive': numberOfUnderFive,
    };
  }
}

//model for socioeconomic
class SocioEconomicFormData {
  String householdIncomeLevel = '';
  String householdAnnualIncome = '';
  String householdPrimarySourceOfIncome = '';
  String typeOfResidence = '';
  String typeOfResidenceOwnership = '';
  List<String> householdAmmenities = [];

  Map<String, dynamic> toJson() {
    return {
      'householdIncomeLevel': householdIncomeLevel,
      'householdAnnualIncome': householdAnnualIncome,
      'householdPrimarySourceOfIncome': householdPrimarySourceOfIncome,
      'typeOfResidence': typeOfResidence,
      'typeOfResidenceOwnership': typeOfResidenceOwnership,
      'householdAmmenities': householdAmmenities,
    };
  }
}


//model for householdillness
class HouseholdIllnessFormData {
  String householdMembersWithIllnessSymptoms = '';
  List<String> illnessTypesOfHouseholdMembers = [];
  String householdMembersTreatmentRequirement = '';
  List<String> typeOfTreatmentSought = [];
  String householdMemberCurrentlySick = '';
  String soughtMedicalAttention = '';
  String memberMedicalFacilityReferralConsent = '';

  Map<String, dynamic> toJson() {
    return {
      'householdMembersWithIllnessSymptoms': householdMembersWithIllnessSymptoms,
      'illnessTypesOfHouseholdMembers': illnessTypesOfHouseholdMembers,
      'householdMembersTreatmentRequirement': householdMembersTreatmentRequirement,
      'typeOfTreatmentSought': typeOfTreatmentSought,
      'householdMemberCurrentlySick': householdMemberCurrentlySick,
      'soughtMedicalAttention': soughtMedicalAttention,
      'memberMedicalFacilityReferralConsent': memberMedicalFacilityReferralConsent,
    };
  }
}


//model for wash
class WashFormData {
  String sourceOfDrinkingWater = '';
  String reliabilityOfWaterSupply = '';
  String treatingConsumptionWater = '';
  String waterTreatmentMethods = '';
  String typeOfSanitationFacility = '';
  String shareOfSanitationFacility = '';
  String cleaningFrequencyOfSanitationFacility = '';
  String accessibilityOfHandWashingFacility = '';
  String householdMemberHandWashingFrequency = '';

  Map<String, dynamic> toJson() {
    return {
      'sourceOfDrinkingWater': sourceOfDrinkingWater,
      'reliabilityOfWaterSupply': reliabilityOfWaterSupply,
      'treatingConsumptionWater': treatingConsumptionWater,
      'waterTreatmentMethods': waterTreatmentMethods,
      'typeOfSanitationFacility': typeOfSanitationFacility,
      'shareOfSanitationFacility': shareOfSanitationFacility,
      'cleaningFrequencyOfSanitationFacility': cleaningFrequencyOfSanitationFacility,
      'accessibilityOfHandWashingFacility': accessibilityOfHandWashingFacility,
      'householdMemberHandWashingFrequency': householdMemberHandWashingFrequency,
    };
  }
}


//model for preventive medicine1
class PreventiveMedicine1FormData {
  String frequencyOfPreventiveHealthCareActivities = '';
  String factorsHinderingPreventiveHealthCareActivities = '';
  String regularPhysicalActivityEngagement = '';
  String fruitsAndVegetablesConsumptionPerDay = '';
  String tobaccoAndNicotineUsage = '';
  String alcoholConsumption = '';

  Map<String, dynamic> toJson() {
    return {
      'frequencyOfPreventiveHealthCareActivities': frequencyOfPreventiveHealthCareActivities,
      'factorsHinderingPreventiveHealthCareActivities': factorsHinderingPreventiveHealthCareActivities,
      'regularPhysicalActivityEngagement': regularPhysicalActivityEngagement,
      'fruitsAndVegetablesConsumptionPerDay': fruitsAndVegetablesConsumptionPerDay,
      'tobaccoAndNicotineUsage': tobaccoAndNicotineUsage,
      'alcoholConsumption': alcoholConsumption,
    };
  }
}


//model for preventive medicine2
class PreventiveMedicine2FormData {
  String routineImmunizationUpToDate = '';
  String lastMedicalCheckupHistory = '';
  String cancerScreening = '';
  String healthInformationAndAwareness = '';
  String recievedEducationOrCounselingHealthMeasures = '';

  Map<String, dynamic> toJson() {
    return {
      'routineImmunizationUpToDate': routineImmunizationUpToDate,
      'lastMedicalCheckupHistory': lastMedicalCheckupHistory,
      'cancerScreening': cancerScreening,
      'healthInformationAndAwareness': healthInformationAndAwareness,
      'recievedEducationOrCounselingHealthMeasures': recievedEducationOrCounselingHealthMeasures,
    };
  }
}




//model for household health profile
class HouseholdHealthProfileFormData {
  List<String> householdPreventiveMeasures = [];
  List<String> barriersToAccessingHealthCareServices = [];

  Map<String, dynamic> toJson() {
    return {
      'householdPreventiveMeasures': householdPreventiveMeasures,
      'barriersToAccessingHealthCareServices': barriersToAccessingHealthCareServices,
    };
  }
}

//combined model for all forms
class CombinedFormData{
  HouseholdDetailsFormData householdDetailsData = HouseholdDetailsFormData();
  SocioEconomicFormData socioEconomicData = SocioEconomicFormData();
  HouseholdIllnessFormData householdIllnessData = HouseholdIllnessFormData();
  WashFormData washData = WashFormData();
  PreventiveMedicine1FormData preventiveMedicine1Data = PreventiveMedicine1FormData();
  PreventiveMedicine2FormData preventiveMedicine2Data = PreventiveMedicine2FormData();
  //ChildHealthStatusFormData childHealthStatusData = ChildHealthStatusFormData();
  HouseholdHealthProfileFormData householdHealthProfileData = HouseholdHealthProfileFormData();

  Map<String, dynamic>  toJson() {
    return {
      'householdDetailsData': householdDetailsData.toJson(),
      'socioEconomicData': socioEconomicData.toJson(),
      'householdIllnessData': householdIllnessData.toJson(),
      'washData': washData.toJson(),
      'preventiveMedicine1Data': preventiveMedicine1Data.toJson(),
      'preventiveMedicine2Data': preventiveMedicine2Data.toJson(),
      //'childHealthStatusData': childHealthStatusData.toJson(),
      'householdHealthProfileData': householdHealthProfileData.toJson(),
    };
  }

  CombinedFormData({
    required this.householdDetailsData,
    required this.socioEconomicData,
    required this.householdIllnessData,
   required this.washData,
    required this.preventiveMedicine1Data,
    required this.preventiveMedicine2Data,
   // required this.childHealthStatusData,
    required this.householdHealthProfileData,
});
}



//model for child health status
/*
class ChildHealthStatusFormData {
  String householdNumber = '';
  String immunizationStatusUpToDate = '';
  String muacScore = '';
  String consentForRefferal = '';
  String illnessExperiencedRecently = '';
  String feedingMethod = '';
  String allergiesOrIntolerances = '';

  Map<String, dynamic> toJson() {
    return {
      'householdNumber': householdNumber,
      'immunizationStatusUpToDate': immunizationStatusUpToDate,
      'muacScore': muacScore,
      'consentForRefferal': consentForRefferal,
      'illnessExperiencedRecently': illnessExperiencedRecently,
      'feedingMethod': feedingMethod,
      'allergiesOrIntolerances': allergiesOrIntolerances,
    };
  }
}
*/

//model for medical reporting form
class MedicalReportingFormData{

}