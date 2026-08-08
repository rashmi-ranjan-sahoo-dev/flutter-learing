import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../data/models/ngo_mode.dart';

final List<NgoModel> ngoList = [
   NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
      NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
     NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
      NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
     NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
      NgoModel(
      name: "Smile Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSqvkcDVAcvqNdy7iJJ6tYJ1G14EY8piyZT6fSiVntVA&s=10",
    ),
    NgoModel(
      name: "CRY",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt8RvJNDsqazjo6LWKz8XcIRaWRk09-Pm7lwcKgl-8ow&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF_UshtK4snvhkEGEjBkgolcrCtEpko8N4ABQz2tpdYg&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR06I24_6Ocp_XUZBM2HQX57LMNXLcerxDyyAC_krNdfA&s=10",
    ),
    NgoModel(
      name: "Give Foundation",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYN8TbMIAqnmXStrx76Y_o-Z2l01d8Qn9byfHODJIvvg&s=10",
    ),
    NgoModel(
      name: "Akshaya Patra",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_19KHJ2y6hwgisUro6q7lvirKrNFSqj0gosXn10asA&s=10",
    ),
    NgoModel(
      name: "UNICEF",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4JJpcDMsKBwRdCCaInBfNu9TKXSC9EnzZ7ajXqKAmvw&s=10",
    ),
    NgoModel(
      name: "WWF India",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU9ZfCIl5Z6kb9VLwBntiyXTmxWY-Mu8Nu7y27xlovYQ&s=10",
    ),
];

final ngoProvider = Provider<List<NgoModel>>((ref) {
  return ngoList;
});

final pageProvider = StateProvider<int>((ref) => 0);