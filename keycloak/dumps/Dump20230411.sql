-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: keycloak
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('019268f9-7bde-4f35-b9f0-542253472dfe',NULL,'client-x509','1cf86083-1024-4ace-a31d-ab4723365ab6','1ba57a81-10eb-4a87-9ad9-8338ee336d97',2,40,_binary '\0',NULL,NULL),('0461e284-fe0c-4bef-a565-1e0b36ce6d72',NULL,'idp-create-user-if-unique','1cf86083-1024-4ace-a31d-ab4723365ab6','da20f603-0210-4759-8350-33273f674da7',2,10,_binary '\0',NULL,'df9f2c0f-8886-486a-b7bb-e2e5362ac193'),('070a33d0-c440-4ebe-b969-a632ac7826e4',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','dd906c0b-7333-4333-b3ee-16b09cb40036',0,20,_binary '','cbd31d3e-2d38-4b41-b442-072a0146090e',NULL),('0b4d7d44-2376-40df-b9f4-8f3e2225ee74',NULL,'reset-credential-email','875d0d7d-7037-4f48-9a40-1307264daea6','780f35f3-5e1c-4214-9283-0860c328cc00',0,20,_binary '\0',NULL,NULL),('0dec34e6-90cf-455c-9869-bd87922cdbea',NULL,'client-jwt','1cf86083-1024-4ace-a31d-ab4723365ab6','1ba57a81-10eb-4a87-9ad9-8338ee336d97',2,20,_binary '\0',NULL,NULL),('14de8bb1-1450-45be-85ab-225ce3f3d315',NULL,'auth-otp-form','1cf86083-1024-4ace-a31d-ab4723365ab6','df4c940b-07c3-4d32-83cc-cfa5e94c82ba',0,20,_binary '\0',NULL,NULL),('15a0ccd2-c52b-4e91-9525-8a6239089abd',NULL,'idp-email-verification','1cf86083-1024-4ace-a31d-ab4723365ab6','f54be6b8-13e9-4ea0-9c2b-9e77e7f13cec',2,10,_binary '\0',NULL,NULL),('15d6c1f5-a071-4aed-be44-2f79d6487157',NULL,'http-basic-authenticator','875d0d7d-7037-4f48-9a40-1307264daea6','6e75579c-4466-4c24-874b-fae383312ebc',0,10,_binary '\0',NULL,NULL),('1ae8be79-5344-446c-99f0-d9ada609faa8',NULL,'idp-email-verification','875d0d7d-7037-4f48-9a40-1307264daea6','90100a4b-ca40-424e-a938-4a8ab37c6b83',2,10,_binary '\0',NULL,NULL),('1e932623-feab-4098-acae-c0b3d59b4a04',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','f2b698bb-4f04-409d-bc93-a4707f7dbc31',0,20,_binary '','da20f603-0210-4759-8350-33273f674da7',NULL),('25808477-d02c-4935-a306-294d293d45e5',NULL,'auth-spnego','875d0d7d-7037-4f48-9a40-1307264daea6','cbd31d3e-2d38-4b41-b442-072a0146090e',3,30,_binary '\0',NULL,NULL),('2596ab0a-7899-41fe-ab75-fdc140cf4ba6',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','780f35f3-5e1c-4214-9283-0860c328cc00',1,40,_binary '','a6e6d48d-e4b4-4bde-af8e-01ebf96a7688',NULL),('2850b033-19b2-4a88-8089-adcc635bec4d',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','3d2fb627-aae3-4e73-a0ed-0bf9bea8694d',1,30,_binary '','156b4f2c-d433-4b14-92e3-412c6cc3059c',NULL),('28954f7f-9013-413b-bd2d-58008268b7a0',NULL,'basic-auth-otp','1cf86083-1024-4ace-a31d-ab4723365ab6','a26dd800-ae19-40f6-b5b5-03bb39feee1f',3,20,_binary '\0',NULL,NULL),('2a346fe6-9ce8-4147-903f-2eb34d639ebf',NULL,'docker-http-basic-authenticator','1cf86083-1024-4ace-a31d-ab4723365ab6','3a889bc2-95a9-4313-84de-70efd9f091e6',0,10,_binary '\0',NULL,NULL),('2b4d5a80-3278-4e4a-aa3f-0dc73797803e',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','de5ff666-ee8d-411d-b6cb-44b7750731aa',1,20,_binary '','df4c940b-07c3-4d32-83cc-cfa5e94c82ba',NULL),('2d750635-29d6-456f-8666-6dbfd1a0e5c5',NULL,'client-secret','875d0d7d-7037-4f48-9a40-1307264daea6','23b38362-2f17-4e96-975b-119afe4081f5',2,10,_binary '\0',NULL,NULL),('2e618a31-e159-4e08-addb-018d4d724997',NULL,'identity-provider-redirector','1cf86083-1024-4ace-a31d-ab4723365ab6','60e177db-2a32-46ca-804c-d6668c8b7f4f',2,25,_binary '\0',NULL,NULL),('2e73c5f1-1a5d-4346-b972-3d36a531bdf9',NULL,'http-basic-authenticator','1cf86083-1024-4ace-a31d-ab4723365ab6','82468e63-1ca7-4fd8-afa6-5f25f01b8698',0,10,_binary '\0',NULL,NULL),('2f430b89-4a95-4f67-8dda-f0b8e7c0e2ac',NULL,'reset-password','1cf86083-1024-4ace-a31d-ab4723365ab6','1ded67d7-68fe-430e-ba2f-ac21034e6b64',0,30,_binary '\0',NULL,NULL),('31aec7ac-cc4b-4693-9493-66703542b24c',NULL,'conditional-user-configured','1cf86083-1024-4ace-a31d-ab4723365ab6','e2eb2f80-740e-480d-9aa1-460ac621a458',0,10,_binary '\0',NULL,NULL),('32d5e923-7501-45c9-89c5-7296545d446a',NULL,'registration-user-creation','1cf86083-1024-4ace-a31d-ab4723365ab6','ab3b990b-5a74-42a7-9675-eec582fbe3a2',0,20,_binary '\0',NULL,NULL),('34f63f47-7829-475d-a7fe-0fee34fb0400',NULL,'registration-user-creation','875d0d7d-7037-4f48-9a40-1307264daea6','41a3f8e7-756b-4353-bbf4-65508b7a427d',0,20,_binary '\0',NULL,NULL),('35aed8c0-e23f-491a-9334-7b9237c825eb',NULL,'basic-auth','1cf86083-1024-4ace-a31d-ab4723365ab6','a26dd800-ae19-40f6-b5b5-03bb39feee1f',0,10,_binary '\0',NULL,NULL),('3b346006-f228-4934-a935-ccf021050c20',NULL,'registration-profile-action','1cf86083-1024-4ace-a31d-ab4723365ab6','ab3b990b-5a74-42a7-9675-eec582fbe3a2',0,40,_binary '\0',NULL,NULL),('3c642028-69ea-40a7-8a0d-e25fa49d10d7',NULL,'client-x509','875d0d7d-7037-4f48-9a40-1307264daea6','23b38362-2f17-4e96-975b-119afe4081f5',2,40,_binary '\0',NULL,NULL),('3ea3c31e-5741-496d-9962-04c4a1ccf32a',NULL,'registration-page-form','875d0d7d-7037-4f48-9a40-1307264daea6','68ed7cb9-07ae-48af-944d-d690f5e258a7',0,10,_binary '','41a3f8e7-756b-4353-bbf4-65508b7a427d',NULL),('48e05890-8522-4fd3-aac4-e337c1f45cd8',NULL,'idp-username-password-form','875d0d7d-7037-4f48-9a40-1307264daea6','31bac07b-71d4-496c-b6b9-a82ed9a8d6da',0,10,_binary '\0',NULL,NULL),('512036ba-63f8-4476-a077-078b43e83efe',NULL,'reset-otp','875d0d7d-7037-4f48-9a40-1307264daea6','a6e6d48d-e4b4-4bde-af8e-01ebf96a7688',0,20,_binary '\0',NULL,NULL),('55a106f2-6611-479a-93ca-8d0e01a23e26',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','6acb46ee-270a-42f2-804a-cd6bb27f6202',1,20,_binary '','e5fc39c3-45d7-45bf-addb-23a7bd830462',NULL),('55c3c519-6e7d-46ff-81b3-02274a7d74ea',NULL,'no-cookie-redirect','1cf86083-1024-4ace-a31d-ab4723365ab6','615ef43a-aafa-4802-a78b-cfeb177e93b8',0,10,_binary '\0',NULL,NULL),('57186090-e70a-455f-8860-b5b9e481d6bd',NULL,'client-jwt','875d0d7d-7037-4f48-9a40-1307264daea6','23b38362-2f17-4e96-975b-119afe4081f5',2,20,_binary '\0',NULL,NULL),('5cc453b2-3f0d-4d5a-b739-74cdfab856db',NULL,'registration-recaptcha-action','1cf86083-1024-4ace-a31d-ab4723365ab6','ab3b990b-5a74-42a7-9675-eec582fbe3a2',3,60,_binary '\0',NULL,NULL),('60612e51-4af2-4324-9156-58f23182f2c2',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','615ef43a-aafa-4802-a78b-cfeb177e93b8',0,20,_binary '','a26dd800-ae19-40f6-b5b5-03bb39feee1f',NULL),('60c3afe9-88c3-4b90-b355-ab97f602d74b',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','60e177db-2a32-46ca-804c-d6668c8b7f4f',2,30,_binary '','de5ff666-ee8d-411d-b6cb-44b7750731aa',NULL),('63822e11-de47-483d-b976-555910fd9153',NULL,'auth-otp-form','1cf86083-1024-4ace-a31d-ab4723365ab6','785c94a2-d20e-4629-9ce2-7859502854a1',0,20,_binary '\0',NULL,NULL),('679665a5-ebf7-4239-a3ef-3fb5bc2ab5d4',NULL,'registration-password-action','1cf86083-1024-4ace-a31d-ab4723365ab6','ab3b990b-5a74-42a7-9675-eec582fbe3a2',0,50,_binary '\0',NULL,NULL),('6a7d1a3f-50c2-4c4f-9ab3-5f8a9a43364a',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','8b89a602-236a-405a-b8a5-a6bc80e9798b',2,20,_binary '','e9752468-d668-4b14-b348-7cac94090341',NULL),('6c288a76-f546-4cfb-b4ec-8f7591b123b7',NULL,'idp-confirm-link','1cf86083-1024-4ace-a31d-ab4723365ab6','3fd73e40-f53e-499d-aeb3-a187cea30354',0,10,_binary '\0',NULL,NULL),('6ca4ced6-d264-4a75-84d7-95bffe8b2d8a',NULL,'reset-credential-email','1cf86083-1024-4ace-a31d-ab4723365ab6','1ded67d7-68fe-430e-ba2f-ac21034e6b64',0,20,_binary '\0',NULL,NULL),('6d417345-aff8-4148-95d7-89ca0db258df',NULL,'reset-credentials-choose-user','875d0d7d-7037-4f48-9a40-1307264daea6','780f35f3-5e1c-4214-9283-0860c328cc00',0,10,_binary '\0',NULL,NULL),('6e39d8eb-5451-41a0-ad16-2d0dd2f12f3a',NULL,'direct-grant-validate-password','1cf86083-1024-4ace-a31d-ab4723365ab6','1932a086-9fce-47d5-9cf6-54de9db6f283',0,20,_binary '\0',NULL,NULL),('745d42ca-1deb-4265-b565-bcd1c558043f',NULL,'conditional-user-configured','875d0d7d-7037-4f48-9a40-1307264daea6','08ff4b11-f861-4f77-ae6f-a12fc472f656',0,10,_binary '\0',NULL,NULL),('77aa02de-590f-41f6-8288-2e70660aba7a',NULL,'auth-spnego','1cf86083-1024-4ace-a31d-ab4723365ab6','a26dd800-ae19-40f6-b5b5-03bb39feee1f',3,30,_binary '\0',NULL,NULL),('78455809-44ef-4c14-a047-5eed0cac49e8',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','da20f603-0210-4759-8350-33273f674da7',2,20,_binary '','3fd73e40-f53e-499d-aeb3-a187cea30354',NULL),('7a575bac-90db-4f88-84de-02fc0594e72b',NULL,'idp-review-profile','1cf86083-1024-4ace-a31d-ab4723365ab6','f2b698bb-4f04-409d-bc93-a4707f7dbc31',0,10,_binary '\0',NULL,'a8990c97-d9d3-4d2a-a091-e0dd6c780e57'),('7b34acc7-aef4-413b-be9f-29471fa01fc8',NULL,'conditional-user-configured','1cf86083-1024-4ace-a31d-ab4723365ab6','3c5f186a-0838-4114-9335-d96e5bf15184',0,10,_binary '\0',NULL,NULL),('7e3cca95-00e5-4002-95d8-714c015f5b7e',NULL,'auth-username-password-form','1cf86083-1024-4ace-a31d-ab4723365ab6','de5ff666-ee8d-411d-b6cb-44b7750731aa',0,10,_binary '\0',NULL,NULL),('80a10648-b88c-4e8a-9513-09e0d6989535',NULL,'registration-recaptcha-action','875d0d7d-7037-4f48-9a40-1307264daea6','41a3f8e7-756b-4353-bbf4-65508b7a427d',3,60,_binary '\0',NULL,NULL),('82d5f548-c236-4c0f-8b8b-7ab55083d9e2',NULL,'direct-grant-validate-otp','1cf86083-1024-4ace-a31d-ab4723365ab6','e2eb2f80-740e-480d-9aa1-460ac621a458',0,20,_binary '\0',NULL,NULL),('84ecf0f6-febf-4b59-a941-d6a5354d9b99',NULL,'conditional-user-configured','1cf86083-1024-4ace-a31d-ab4723365ab6','df4c940b-07c3-4d32-83cc-cfa5e94c82ba',0,10,_binary '\0',NULL,NULL),('84ed2674-d8e0-4766-8172-02976f5c4015',NULL,'docker-http-basic-authenticator','875d0d7d-7037-4f48-9a40-1307264daea6','c956fdfa-6cae-43a2-a1e9-2a607a7fa759',0,10,_binary '\0',NULL,NULL),('8be58be5-0149-470e-b62e-6568cc0ff37b',NULL,'basic-auth-otp','875d0d7d-7037-4f48-9a40-1307264daea6','cbd31d3e-2d38-4b41-b442-072a0146090e',3,20,_binary '\0',NULL,NULL),('8c1f0567-114e-44aa-80f1-3f54a78fa7cd',NULL,'basic-auth','875d0d7d-7037-4f48-9a40-1307264daea6','cbd31d3e-2d38-4b41-b442-072a0146090e',0,10,_binary '\0',NULL,NULL),('9353ae06-ac7c-4051-b45b-495e8290bc36',NULL,'conditional-user-configured','875d0d7d-7037-4f48-9a40-1307264daea6','a6e6d48d-e4b4-4bde-af8e-01ebf96a7688',0,10,_binary '\0',NULL,NULL),('9431810e-d5fb-4ede-a7d8-69a1c2e2d9c5',NULL,'auth-otp-form','875d0d7d-7037-4f48-9a40-1307264daea6','e5fc39c3-45d7-45bf-addb-23a7bd830462',0,20,_binary '\0',NULL,NULL),('9481c652-825d-49a9-bfa2-121a2599ce18',NULL,'auth-spnego','875d0d7d-7037-4f48-9a40-1307264daea6','e27f5fde-d575-4807-b828-94a999d4ac72',3,20,_binary '\0',NULL,NULL),('9bcf8fc9-eb8c-4415-b4e4-64ff0c82e050',NULL,'identity-provider-redirector','875d0d7d-7037-4f48-9a40-1307264daea6','e27f5fde-d575-4807-b828-94a999d4ac72',2,25,_binary '\0',NULL,NULL),('a5fd4716-e405-45ca-bd4f-68449c76a887',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','1932a086-9fce-47d5-9cf6-54de9db6f283',1,30,_binary '','e2eb2f80-740e-480d-9aa1-460ac621a458',NULL),('a6cfc7c5-fb16-4764-a0a8-9f42bad9c577',NULL,'idp-review-profile','875d0d7d-7037-4f48-9a40-1307264daea6','fa0e8567-f304-4884-9c61-37b04bb40ade',0,10,_binary '\0',NULL,'ffe64e87-1434-4947-b509-94dfc80c51ed'),('aa67d1ef-7374-4597-b581-69a8c8e1a103',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','e9752468-d668-4b14-b348-7cac94090341',0,20,_binary '','90100a4b-ca40-424e-a938-4a8ab37c6b83',NULL),('aae55214-92d8-4e01-8cfc-cd179026ed0b',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','90100a4b-ca40-424e-a938-4a8ab37c6b83',2,20,_binary '','31bac07b-71d4-496c-b6b9-a82ed9a8d6da',NULL),('ab93355d-b958-4171-961b-eafb614ba1d2',NULL,'reset-password','875d0d7d-7037-4f48-9a40-1307264daea6','780f35f3-5e1c-4214-9283-0860c328cc00',0,30,_binary '\0',NULL,NULL),('af7442d3-11c7-4f3b-95ef-efc775af872a',NULL,'client-secret-jwt','875d0d7d-7037-4f48-9a40-1307264daea6','23b38362-2f17-4e96-975b-119afe4081f5',2,30,_binary '\0',NULL,NULL),('b367ddd7-1741-4d7e-8cf2-d35dc15ca0cc',NULL,'registration-page-form','1cf86083-1024-4ace-a31d-ab4723365ab6','5c709356-f146-464f-98ac-69a3aac174b0',0,10,_binary '','ab3b990b-5a74-42a7-9675-eec582fbe3a2',NULL),('b5b06b0e-8d47-4184-810f-b30c0772d749',NULL,'registration-profile-action','875d0d7d-7037-4f48-9a40-1307264daea6','41a3f8e7-756b-4353-bbf4-65508b7a427d',0,40,_binary '\0',NULL,NULL),('b9e167e6-4098-4b90-900e-856b8fa29386',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','fa0e8567-f304-4884-9c61-37b04bb40ade',0,20,_binary '','8b89a602-236a-405a-b8a5-a6bc80e9798b',NULL),('bbe22fd0-4f6a-41ec-b2c8-9056374b42c4',NULL,'registration-password-action','875d0d7d-7037-4f48-9a40-1307264daea6','41a3f8e7-756b-4353-bbf4-65508b7a427d',0,50,_binary '\0',NULL,NULL),('bde8a3aa-9af1-4061-87fd-ede44032b841',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','31bac07b-71d4-496c-b6b9-a82ed9a8d6da',1,20,_binary '','08ff4b11-f861-4f77-ae6f-a12fc472f656',NULL),('c1c307b5-187b-4150-ba41-52ac49d1321e',NULL,'conditional-user-configured','1cf86083-1024-4ace-a31d-ab4723365ab6','785c94a2-d20e-4629-9ce2-7859502854a1',0,10,_binary '\0',NULL,NULL),('ca3c8b54-46c5-4409-a6f1-8ae162795aa8',NULL,'conditional-user-configured','875d0d7d-7037-4f48-9a40-1307264daea6','156b4f2c-d433-4b14-92e3-412c6cc3059c',0,10,_binary '\0',NULL,NULL),('d1f64da5-7d95-478b-a9ee-e6d55ffdfc45',NULL,'idp-create-user-if-unique','875d0d7d-7037-4f48-9a40-1307264daea6','8b89a602-236a-405a-b8a5-a6bc80e9798b',2,10,_binary '\0',NULL,'2e4deb2c-f72d-4554-ae1a-983147d9e2f9'),('d2925779-adbb-45a4-ba00-fd84cd914a38',NULL,'direct-grant-validate-username','1cf86083-1024-4ace-a31d-ab4723365ab6','1932a086-9fce-47d5-9cf6-54de9db6f283',0,10,_binary '\0',NULL,NULL),('d39fc7d5-5518-4d40-aeb7-6209669513b7',NULL,'client-secret-jwt','1cf86083-1024-4ace-a31d-ab4723365ab6','1ba57a81-10eb-4a87-9ad9-8338ee336d97',2,30,_binary '\0',NULL,NULL),('d5c25532-480b-4fc6-8385-c60be89fea3e',NULL,'direct-grant-validate-otp','875d0d7d-7037-4f48-9a40-1307264daea6','156b4f2c-d433-4b14-92e3-412c6cc3059c',0,20,_binary '\0',NULL,NULL),('d5f37e5b-1c09-4a81-ae88-9b1f52043d41',NULL,'auth-spnego','1cf86083-1024-4ace-a31d-ab4723365ab6','60e177db-2a32-46ca-804c-d6668c8b7f4f',3,20,_binary '\0',NULL,NULL),('d8864e03-01b2-47fb-b733-49cd4bd139a2',NULL,'direct-grant-validate-password','875d0d7d-7037-4f48-9a40-1307264daea6','3d2fb627-aae3-4e73-a0ed-0bf9bea8694d',0,20,_binary '\0',NULL,NULL),('dc2122ef-0f75-4a4b-ae1e-fb1bc42056d6',NULL,NULL,'875d0d7d-7037-4f48-9a40-1307264daea6','e27f5fde-d575-4807-b828-94a999d4ac72',2,30,_binary '','6acb46ee-270a-42f2-804a-cd6bb27f6202',NULL),('dd593cc6-a519-4538-ae4e-e04f25c209cb',NULL,'idp-username-password-form','1cf86083-1024-4ace-a31d-ab4723365ab6','0690fb46-45ec-488d-ba06-989496f82f91',0,10,_binary '\0',NULL,NULL),('dddc5936-4a2d-4d53-9e98-e8863ee54a6f',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','f54be6b8-13e9-4ea0-9c2b-9e77e7f13cec',2,20,_binary '','0690fb46-45ec-488d-ba06-989496f82f91',NULL),('dedca21d-3640-4343-990e-3b0d019b06d8',NULL,'client-secret','1cf86083-1024-4ace-a31d-ab4723365ab6','1ba57a81-10eb-4a87-9ad9-8338ee336d97',2,10,_binary '\0',NULL,NULL),('defb9f9b-0614-4b16-9647-df2d874155fa',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','3fd73e40-f53e-499d-aeb3-a187cea30354',0,20,_binary '','f54be6b8-13e9-4ea0-9c2b-9e77e7f13cec',NULL),('e1812c37-3336-4309-818d-fd5b1cfb36a4',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','0690fb46-45ec-488d-ba06-989496f82f91',1,20,_binary '','785c94a2-d20e-4629-9ce2-7859502854a1',NULL),('e22140ba-62f1-4c81-8657-81fac37579e1',NULL,'reset-credentials-choose-user','1cf86083-1024-4ace-a31d-ab4723365ab6','1ded67d7-68fe-430e-ba2f-ac21034e6b64',0,10,_binary '\0',NULL,NULL),('e8a19cf8-7247-4364-8f59-b7fac0c5ec21',NULL,'auth-otp-form','875d0d7d-7037-4f48-9a40-1307264daea6','08ff4b11-f861-4f77-ae6f-a12fc472f656',0,20,_binary '\0',NULL,NULL),('ef6046e3-e0a6-41b3-890a-43f67833ba23',NULL,NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','1ded67d7-68fe-430e-ba2f-ac21034e6b64',1,40,_binary '','3c5f186a-0838-4114-9335-d96e5bf15184',NULL),('f270a4c1-1cec-461c-af47-27c6a9e39d96',NULL,'reset-otp','1cf86083-1024-4ace-a31d-ab4723365ab6','3c5f186a-0838-4114-9335-d96e5bf15184',0,20,_binary '\0',NULL,NULL),('f31c7708-2a99-4ea3-9a38-d13e3330d115',NULL,'auth-username-password-form','875d0d7d-7037-4f48-9a40-1307264daea6','6acb46ee-270a-42f2-804a-cd6bb27f6202',0,10,_binary '\0',NULL,NULL),('f523a0ec-655a-426e-9aa6-90a805f69f41',NULL,'auth-cookie','875d0d7d-7037-4f48-9a40-1307264daea6','e27f5fde-d575-4807-b828-94a999d4ac72',2,10,_binary '\0',NULL,NULL),('f5af7881-4974-4a9c-948e-376a9d2e2711',NULL,'no-cookie-redirect','875d0d7d-7037-4f48-9a40-1307264daea6','dd906c0b-7333-4333-b3ee-16b09cb40036',0,10,_binary '\0',NULL,NULL),('fc86bb8f-6a16-4888-af41-24f40057e036',NULL,'direct-grant-validate-username','875d0d7d-7037-4f48-9a40-1307264daea6','3d2fb627-aae3-4e73-a0ed-0bf9bea8694d',0,10,_binary '\0',NULL,NULL),('fe0670f9-d0d7-4318-a8a7-dfbc6a185531',NULL,'idp-confirm-link','875d0d7d-7037-4f48-9a40-1307264daea6','e9752468-d668-4b14-b348-7cac94090341',0,10,_binary '\0',NULL,NULL),('febb7fbd-9714-405b-abf3-e8de525207ad',NULL,'conditional-user-configured','875d0d7d-7037-4f48-9a40-1307264daea6','e5fc39c3-45d7-45bf-addb-23a7bd830462',0,10,_binary '\0',NULL,NULL),('febd5dba-07f8-4858-b377-b3f7fb47fa5e',NULL,'auth-cookie','1cf86083-1024-4ace-a31d-ab4723365ab6','60e177db-2a32-46ca-804c-d6668c8b7f4f',2,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('0690fb46-45ec-488d-ba06-989496f82f91','Verify Existing Account by Re-authentication','Reauthentication of existing account','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('08ff4b11-f861-4f77-ae6f-a12fc472f656','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('156b4f2c-d433-4b14-92e3-412c6cc3059c','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('1932a086-9fce-47d5-9cf6-54de9db6f283','direct grant','OpenID Connect Resource Owner Grant','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('1ba57a81-10eb-4a87-9ad9-8338ee336d97','clients','Base authentication for clients','1cf86083-1024-4ace-a31d-ab4723365ab6','client-flow',_binary '',_binary ''),('1ded67d7-68fe-430e-ba2f-ac21034e6b64','reset credentials','Reset credentials for a user if they forgot their password or something','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('23b38362-2f17-4e96-975b-119afe4081f5','clients','Base authentication for clients','875d0d7d-7037-4f48-9a40-1307264daea6','client-flow',_binary '',_binary ''),('31bac07b-71d4-496c-b6b9-a82ed9a8d6da','Verify Existing Account by Re-authentication','Reauthentication of existing account','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('3a889bc2-95a9-4313-84de-70efd9f091e6','docker auth','Used by Docker clients to authenticate against the IDP','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('3c5f186a-0838-4114-9335-d96e5bf15184','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('3d2fb627-aae3-4e73-a0ed-0bf9bea8694d','direct grant','OpenID Connect Resource Owner Grant','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('3fd73e40-f53e-499d-aeb3-a187cea30354','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('41a3f8e7-756b-4353-bbf4-65508b7a427d','registration form','registration form','875d0d7d-7037-4f48-9a40-1307264daea6','form-flow',_binary '\0',_binary ''),('5c709356-f146-464f-98ac-69a3aac174b0','registration','registration flow','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('60e177db-2a32-46ca-804c-d6668c8b7f4f','browser','browser based authentication','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('615ef43a-aafa-4802-a78b-cfeb177e93b8','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('68ed7cb9-07ae-48af-944d-d690f5e258a7','registration','registration flow','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('6acb46ee-270a-42f2-804a-cd6bb27f6202','forms','Username, password, otp and other auth forms.','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('6e75579c-4466-4c24-874b-fae383312ebc','saml ecp','SAML ECP Profile Authentication Flow','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('780f35f3-5e1c-4214-9283-0860c328cc00','reset credentials','Reset credentials for a user if they forgot their password or something','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('785c94a2-d20e-4629-9ce2-7859502854a1','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('82468e63-1ca7-4fd8-afa6-5f25f01b8698','saml ecp','SAML ECP Profile Authentication Flow','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('8b89a602-236a-405a-b8a5-a6bc80e9798b','User creation or linking','Flow for the existing/non-existing user alternatives','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('90100a4b-ca40-424e-a938-4a8ab37c6b83','Account verification options','Method with which to verity the existing account','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('a26dd800-ae19-40f6-b5b5-03bb39feee1f','Authentication Options','Authentication options.','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('a6e6d48d-e4b4-4bde-af8e-01ebf96a7688','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('ab3b990b-5a74-42a7-9675-eec582fbe3a2','registration form','registration form','1cf86083-1024-4ace-a31d-ab4723365ab6','form-flow',_binary '\0',_binary ''),('c956fdfa-6cae-43a2-a1e9-2a607a7fa759','docker auth','Used by Docker clients to authenticate against the IDP','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('cbd31d3e-2d38-4b41-b442-072a0146090e','Authentication Options','Authentication options.','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('da20f603-0210-4759-8350-33273f674da7','User creation or linking','Flow for the existing/non-existing user alternatives','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('dd906c0b-7333-4333-b3ee-16b09cb40036','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('de5ff666-ee8d-411d-b6cb-44b7750731aa','forms','Username, password, otp and other auth forms.','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('df4c940b-07c3-4d32-83cc-cfa5e94c82ba','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('e27f5fde-d575-4807-b828-94a999d4ac72','browser','browser based authentication','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary ''),('e2eb2f80-740e-480d-9aa1-460ac621a458','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('e5fc39c3-45d7-45bf-addb-23a7bd830462','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('e9752468-d668-4b14-b348-7cac94090341','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '\0',_binary ''),('f2b698bb-4f04-409d-bc93-a4707f7dbc31','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '',_binary ''),('f54be6b8-13e9-4ea0-9c2b-9e77e7f13cec','Account verification options','Method with which to verity the existing account','1cf86083-1024-4ace-a31d-ab4723365ab6','basic-flow',_binary '\0',_binary ''),('fa0e8567-f304-4884-9c61-37b04bb40ade','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','875d0d7d-7037-4f48-9a40-1307264daea6','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('2e4deb2c-f72d-4554-ae1a-983147d9e2f9','create unique user config','875d0d7d-7037-4f48-9a40-1307264daea6'),('a8990c97-d9d3-4d2a-a091-e0dd6c780e57','review profile config','1cf86083-1024-4ace-a31d-ab4723365ab6'),('df9f2c0f-8886-486a-b7bb-e2e5362ac193','create unique user config','1cf86083-1024-4ace-a31d-ab4723365ab6'),('ffe64e87-1434-4947-b509-94dfc80c51ed','review profile config','875d0d7d-7037-4f48-9a40-1307264daea6');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('2e4deb2c-f72d-4554-ae1a-983147d9e2f9','false','require.password.update.after.registration'),('a8990c97-d9d3-4d2a-a091-e0dd6c780e57','missing','update.profile.on.first.login'),('df9f2c0f-8886-486a-b7bb-e2e5362ac193','false','require.password.update.after.registration'),('ffe64e87-1434-4947-b509-94dfc80c51ed','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/institute-management/account/',_binary '\0',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1dfe32a0-7778-40d8-b635-89fd3f383db4',_binary '',_binary '','ui-app',0,_binary '',NULL,'',_binary '\0','*',_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','http://localhost:4200','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('201b787c-2f22-4495-9581-ff0dc5485d15',_binary '',_binary '\0','institute-management-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,0,_binary '\0',_binary '\0','institute-management Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2342ba09-f99d-4a24-a53e-5291e2326543',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('6bbad496-2df1-4ff6-8639-fd89936c8605',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('75dd22d0-db90-47eb-9c07-c32d92103ada',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/institute-management/account/',_binary '\0',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('82111ee4-3fa2-48d9-8e67-888bf357bb07',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('83ae6f59-7c8b-4115-872f-9526bacecefa',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/institute-management/console/',_binary '\0',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','875d0d7d-7037-4f48-9a40-1307264daea6','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',_binary '',_binary '','institute-management-service',0,_binary '\0','**********','',_binary '\0','*',_binary '\0','1cf86083-1024-4ace-a31d-ab4723365ab6','openid-connect',-1,_binary '',_binary '\0','',_binary '','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('1407631e-e679-4cff-83b6-ee30e436ae4d','post.logout.redirect.uris','+'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','backchannel.logout.revoke.offline.tokens','false'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','backchannel.logout.session.required','true'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','display.on.consent.screen','false'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','oauth2.device.authorization.grant.enabled','false'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','oidc.ciba.grant.enabled','false'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','post.logout.redirect.uris','+'),('2342ba09-f99d-4a24-a53e-5291e2326543','post.logout.redirect.uris','+'),('6bbad496-2df1-4ff6-8639-fd89936c8605','pkce.code.challenge.method','S256'),('6bbad496-2df1-4ff6-8639-fd89936c8605','post.logout.redirect.uris','+'),('7763a689-4032-44df-acf1-3931c2e34202','pkce.code.challenge.method','S256'),('7763a689-4032-44df-acf1-3931c2e34202','post.logout.redirect.uris','+'),('83ae6f59-7c8b-4115-872f-9526bacecefa','pkce.code.challenge.method','S256'),('83ae6f59-7c8b-4115-872f-9526bacecefa','post.logout.redirect.uris','+'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','pkce.code.challenge.method','S256'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','post.logout.redirect.uris','+'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','post.logout.redirect.uris','+'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','post.logout.redirect.uris','+'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','post.logout.redirect.uris','+'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','backchannel.logout.revoke.offline.tokens','false'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','backchannel.logout.session.required','true'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','client.secret.creation.time','1672849314'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','display.on.consent.screen','false'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','oauth2.device.authorization.grant.enabled','false'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','oidc.ciba.grant.enabled','false'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('008a04d0-5c34-4b3e-b031-43c45cf7202c','roles','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect scope for add user roles to the access token','openid-connect'),('17bc2cd4-8e3f-4449-887d-becb2c6a546b','phone','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect built-in scope: phone','openid-connect'),('1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95','microprofile-jwt','1cf86083-1024-4ace-a31d-ab4723365ab6','Microprofile - JWT built-in scope','openid-connect'),('1e25fbda-1c11-4eb2-8590-f0089d25bbf0','microprofile-jwt','875d0d7d-7037-4f48-9a40-1307264daea6','Microprofile - JWT built-in scope','openid-connect'),('3c5d8407-4620-4164-b891-c0f1be5c9330','address','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect built-in scope: address','openid-connect'),('3ded8a6b-e2df-4dea-9e3c-161866541751','role_list','875d0d7d-7037-4f48-9a40-1307264daea6','SAML role list','saml'),('5d3129cc-92b4-4020-9fd9-edacbfe3073d','role_list','1cf86083-1024-4ace-a31d-ab4723365ab6','SAML role list','saml'),('6a4813f2-a0dc-4ad3-a608-379970f6f4e0','offline_access','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect built-in scope: offline_access','openid-connect'),('6ad43d37-8d90-48ee-8514-f12034ca4b0d','address','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect built-in scope: address','openid-connect'),('7609e4ee-99ff-4627-bf2a-45c628fd9740','profile','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect built-in scope: profile','openid-connect'),('77fbbf0a-1b5f-45f4-b26d-033361dadee5','offline_access','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect built-in scope: offline_access','openid-connect'),('7b8d28a6-e8ed-4977-b397-2aaface17d9f','roles','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect scope for add user roles to the access token','openid-connect'),('7e712399-33c0-4581-b084-1081b1a15625','email','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect built-in scope: email','openid-connect'),('7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc','web-origins','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('88a5fc39-b110-4796-a5a7-480073f6add5','web-origins','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('b4a230e2-0ac9-4c02-8b48-ac330255e043','acr','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('c1c391be-f3e8-4e31-8055-5798d79ab1db','email','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect built-in scope: email','openid-connect'),('ee6860a5-0273-4f73-ac3e-6933e304ac4e','profile','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect built-in scope: profile','openid-connect'),('f667aa97-8da8-4be8-9da6-9eee68083db7','acr','1cf86083-1024-4ace-a31d-ab4723365ab6','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('fe45ed2a-5279-4596-8ce4-08e70f9f38c8','phone','875d0d7d-7037-4f48-9a40-1307264daea6','OpenID Connect built-in scope: phone','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('008a04d0-5c34-4b3e-b031-43c45cf7202c','${rolesScopeConsentText}','consent.screen.text'),('008a04d0-5c34-4b3e-b031-43c45cf7202c','true','display.on.consent.screen'),('008a04d0-5c34-4b3e-b031-43c45cf7202c','false','include.in.token.scope'),('17bc2cd4-8e3f-4449-887d-becb2c6a546b','${phoneScopeConsentText}','consent.screen.text'),('17bc2cd4-8e3f-4449-887d-becb2c6a546b','true','display.on.consent.screen'),('17bc2cd4-8e3f-4449-887d-becb2c6a546b','true','include.in.token.scope'),('1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95','false','display.on.consent.screen'),('1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95','true','include.in.token.scope'),('1e25fbda-1c11-4eb2-8590-f0089d25bbf0','false','display.on.consent.screen'),('1e25fbda-1c11-4eb2-8590-f0089d25bbf0','true','include.in.token.scope'),('3c5d8407-4620-4164-b891-c0f1be5c9330','${addressScopeConsentText}','consent.screen.text'),('3c5d8407-4620-4164-b891-c0f1be5c9330','true','display.on.consent.screen'),('3c5d8407-4620-4164-b891-c0f1be5c9330','true','include.in.token.scope'),('3ded8a6b-e2df-4dea-9e3c-161866541751','${samlRoleListScopeConsentText}','consent.screen.text'),('3ded8a6b-e2df-4dea-9e3c-161866541751','true','display.on.consent.screen'),('5d3129cc-92b4-4020-9fd9-edacbfe3073d','${samlRoleListScopeConsentText}','consent.screen.text'),('5d3129cc-92b4-4020-9fd9-edacbfe3073d','true','display.on.consent.screen'),('6a4813f2-a0dc-4ad3-a608-379970f6f4e0','${offlineAccessScopeConsentText}','consent.screen.text'),('6a4813f2-a0dc-4ad3-a608-379970f6f4e0','true','display.on.consent.screen'),('6ad43d37-8d90-48ee-8514-f12034ca4b0d','${addressScopeConsentText}','consent.screen.text'),('6ad43d37-8d90-48ee-8514-f12034ca4b0d','true','display.on.consent.screen'),('6ad43d37-8d90-48ee-8514-f12034ca4b0d','true','include.in.token.scope'),('7609e4ee-99ff-4627-bf2a-45c628fd9740','${profileScopeConsentText}','consent.screen.text'),('7609e4ee-99ff-4627-bf2a-45c628fd9740','true','display.on.consent.screen'),('7609e4ee-99ff-4627-bf2a-45c628fd9740','true','include.in.token.scope'),('77fbbf0a-1b5f-45f4-b26d-033361dadee5','${offlineAccessScopeConsentText}','consent.screen.text'),('77fbbf0a-1b5f-45f4-b26d-033361dadee5','true','display.on.consent.screen'),('7b8d28a6-e8ed-4977-b397-2aaface17d9f','${rolesScopeConsentText}','consent.screen.text'),('7b8d28a6-e8ed-4977-b397-2aaface17d9f','true','display.on.consent.screen'),('7b8d28a6-e8ed-4977-b397-2aaface17d9f','false','include.in.token.scope'),('7e712399-33c0-4581-b084-1081b1a15625','${emailScopeConsentText}','consent.screen.text'),('7e712399-33c0-4581-b084-1081b1a15625','true','display.on.consent.screen'),('7e712399-33c0-4581-b084-1081b1a15625','true','include.in.token.scope'),('7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc','','consent.screen.text'),('7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc','false','display.on.consent.screen'),('7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc','false','include.in.token.scope'),('88a5fc39-b110-4796-a5a7-480073f6add5','','consent.screen.text'),('88a5fc39-b110-4796-a5a7-480073f6add5','false','display.on.consent.screen'),('88a5fc39-b110-4796-a5a7-480073f6add5','false','include.in.token.scope'),('b4a230e2-0ac9-4c02-8b48-ac330255e043','false','display.on.consent.screen'),('b4a230e2-0ac9-4c02-8b48-ac330255e043','false','include.in.token.scope'),('c1c391be-f3e8-4e31-8055-5798d79ab1db','${emailScopeConsentText}','consent.screen.text'),('c1c391be-f3e8-4e31-8055-5798d79ab1db','true','display.on.consent.screen'),('c1c391be-f3e8-4e31-8055-5798d79ab1db','true','include.in.token.scope'),('ee6860a5-0273-4f73-ac3e-6933e304ac4e','${profileScopeConsentText}','consent.screen.text'),('ee6860a5-0273-4f73-ac3e-6933e304ac4e','true','display.on.consent.screen'),('ee6860a5-0273-4f73-ac3e-6933e304ac4e','true','include.in.token.scope'),('f667aa97-8da8-4be8-9da6-9eee68083db7','false','display.on.consent.screen'),('f667aa97-8da8-4be8-9da6-9eee68083db7','false','include.in.token.scope'),('fe45ed2a-5279-4596-8ce4-08e70f9f38c8','${phoneScopeConsentText}','consent.screen.text'),('fe45ed2a-5279-4596-8ce4-08e70f9f38c8','true','display.on.consent.screen'),('fe45ed2a-5279-4596-8ce4-08e70f9f38c8','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('1407631e-e679-4cff-83b6-ee30e436ae4d','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('1407631e-e679-4cff-83b6-ee30e436ae4d','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('1407631e-e679-4cff-83b6-ee30e436ae4d','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('1407631e-e679-4cff-83b6-ee30e436ae4d','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('1407631e-e679-4cff-83b6-ee30e436ae4d','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('1407631e-e679-4cff-83b6-ee30e436ae4d','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('1407631e-e679-4cff-83b6-ee30e436ae4d','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('1407631e-e679-4cff-83b6-ee30e436ae4d','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('1407631e-e679-4cff-83b6-ee30e436ae4d','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('1dfe32a0-7778-40d8-b635-89fd3f383db4','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('1dfe32a0-7778-40d8-b635-89fd3f383db4','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('1dfe32a0-7778-40d8-b635-89fd3f383db4','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('1dfe32a0-7778-40d8-b635-89fd3f383db4','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('1dfe32a0-7778-40d8-b635-89fd3f383db4','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('2342ba09-f99d-4a24-a53e-5291e2326543','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('2342ba09-f99d-4a24-a53e-5291e2326543','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('2342ba09-f99d-4a24-a53e-5291e2326543','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('2342ba09-f99d-4a24-a53e-5291e2326543','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('2342ba09-f99d-4a24-a53e-5291e2326543','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('2342ba09-f99d-4a24-a53e-5291e2326543','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('2342ba09-f99d-4a24-a53e-5291e2326543','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('2342ba09-f99d-4a24-a53e-5291e2326543','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('2342ba09-f99d-4a24-a53e-5291e2326543','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('6bbad496-2df1-4ff6-8639-fd89936c8605','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('6bbad496-2df1-4ff6-8639-fd89936c8605','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('6bbad496-2df1-4ff6-8639-fd89936c8605','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('6bbad496-2df1-4ff6-8639-fd89936c8605','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('75dd22d0-db90-47eb-9c07-c32d92103ada','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('75dd22d0-db90-47eb-9c07-c32d92103ada','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('75dd22d0-db90-47eb-9c07-c32d92103ada','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('75dd22d0-db90-47eb-9c07-c32d92103ada','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('75dd22d0-db90-47eb-9c07-c32d92103ada','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('75dd22d0-db90-47eb-9c07-c32d92103ada','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('75dd22d0-db90-47eb-9c07-c32d92103ada','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('75dd22d0-db90-47eb-9c07-c32d92103ada','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('75dd22d0-db90-47eb-9c07-c32d92103ada','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('7763a689-4032-44df-acf1-3931c2e34202','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('7763a689-4032-44df-acf1-3931c2e34202','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('7763a689-4032-44df-acf1-3931c2e34202','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('7763a689-4032-44df-acf1-3931c2e34202','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('7763a689-4032-44df-acf1-3931c2e34202','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('81123f05-0cf2-46bd-b502-9b69b4b38987','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('81123f05-0cf2-46bd-b502-9b69b4b38987','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('81123f05-0cf2-46bd-b502-9b69b4b38987','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('81123f05-0cf2-46bd-b502-9b69b4b38987','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('82111ee4-3fa2-48d9-8e67-888bf357bb07','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('82111ee4-3fa2-48d9-8e67-888bf357bb07','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('82111ee4-3fa2-48d9-8e67-888bf357bb07','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('82111ee4-3fa2-48d9-8e67-888bf357bb07','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('82111ee4-3fa2-48d9-8e67-888bf357bb07','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('82111ee4-3fa2-48d9-8e67-888bf357bb07','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('82111ee4-3fa2-48d9-8e67-888bf357bb07','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('82111ee4-3fa2-48d9-8e67-888bf357bb07','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('82111ee4-3fa2-48d9-8e67-888bf357bb07','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('83ae6f59-7c8b-4115-872f-9526bacecefa','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('83ae6f59-7c8b-4115-872f-9526bacecefa','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('83ae6f59-7c8b-4115-872f-9526bacecefa','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('83ae6f59-7c8b-4115-872f-9526bacecefa','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('83ae6f59-7c8b-4115-872f-9526bacecefa','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('83ae6f59-7c8b-4115-872f-9526bacecefa','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('83ae6f59-7c8b-4115-872f-9526bacecefa','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('83ae6f59-7c8b-4115-872f-9526bacecefa','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('83ae6f59-7c8b-4115-872f-9526bacecefa','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('98f58e78-360d-4236-bbe3-c1ac5c90ae67','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('cb0ce7bb-dd8a-4d62-b545-d744e5839931','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('6a4813f2-a0dc-4ad3-a608-379970f6f4e0','76ac3863-0d28-4ed9-a81b-9a63bc979db6'),('77fbbf0a-1b5f-45f4-b26d-033361dadee5','2c201297-74ae-4575-96f0-2364006df9c5');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('01372727-75c9-496f-a856-e6a7183605e6','Allowed Protocol Mapper Types','875d0d7d-7037-4f48-9a40-1307264daea6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','authenticated'),('095a1d31-47cd-4bd9-ad35-7dcc3e4ecf9c','Consent Required','875d0d7d-7037-4f48-9a40-1307264daea6','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('1088998d-e101-4b7d-bc66-3878a1a1dcd6','Allowed Client Scopes','875d0d7d-7037-4f48-9a40-1307264daea6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','authenticated'),('1dc00f4e-da90-4198-a49f-afa264708be4','Trusted Hosts','875d0d7d-7037-4f48-9a40-1307264daea6','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('26bd5e4d-9331-4a06-b0c0-b4a528fa6cca','rsa-generated','1cf86083-1024-4ace-a31d-ab4723365ab6','rsa-generated','org.keycloak.keys.KeyProvider','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL),('3a926ba1-aa22-4450-9523-f81b8ccd3834','Allowed Client Scopes','1cf86083-1024-4ace-a31d-ab4723365ab6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','authenticated'),('3b487b9b-9907-4404-a05b-4de2f87ec4fa','hmac-generated','1cf86083-1024-4ace-a31d-ab4723365ab6','hmac-generated','org.keycloak.keys.KeyProvider','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL),('441773a5-e171-459a-b1fa-5f62479e4263','Allowed Protocol Mapper Types','1cf86083-1024-4ace-a31d-ab4723365ab6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('458c66e6-e4d6-4c37-b5bf-c82b8c87721b','Allowed Protocol Mapper Types','875d0d7d-7037-4f48-9a40-1307264daea6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('48c6e54d-c688-41fb-b0b4-84e5022bfb40','aes-generated','875d0d7d-7037-4f48-9a40-1307264daea6','aes-generated','org.keycloak.keys.KeyProvider','875d0d7d-7037-4f48-9a40-1307264daea6',NULL),('4c949593-e9da-420e-a900-ba7dbce7b730','Trusted Hosts','1cf86083-1024-4ace-a31d-ab4723365ab6','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('551b9347-4a29-44ab-a8ef-129e9825e2a2',NULL,'1cf86083-1024-4ace-a31d-ab4723365ab6','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL),('6c96fabc-9114-4101-bdbe-7d7f46f73268','aes-generated','1cf86083-1024-4ace-a31d-ab4723365ab6','aes-generated','org.keycloak.keys.KeyProvider','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL),('8b6d5933-ae13-44f6-bf43-10ff15b971e5','Full Scope Disabled','1cf86083-1024-4ace-a31d-ab4723365ab6','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('8bdd4115-937c-4f9b-920b-cf237a1aca4e','Consent Required','1cf86083-1024-4ace-a31d-ab4723365ab6','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('9f742a3e-f8d3-4c01-beb1-81d00e1e6c86','rsa-enc-generated','1cf86083-1024-4ace-a31d-ab4723365ab6','rsa-enc-generated','org.keycloak.keys.KeyProvider','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL),('aa29b8c0-8196-4009-96b9-0fa4e170024f','rsa-enc-generated','875d0d7d-7037-4f48-9a40-1307264daea6','rsa-enc-generated','org.keycloak.keys.KeyProvider','875d0d7d-7037-4f48-9a40-1307264daea6',NULL),('b9d35011-507c-4cd0-89b5-655cd82cced3','rsa-generated','875d0d7d-7037-4f48-9a40-1307264daea6','rsa-generated','org.keycloak.keys.KeyProvider','875d0d7d-7037-4f48-9a40-1307264daea6',NULL),('bd55f943-e39c-481f-97bf-4cd9043882aa','Allowed Client Scopes','875d0d7d-7037-4f48-9a40-1307264daea6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('bf0e4ac8-3ee7-4372-8823-340bc56811b0','Allowed Protocol Mapper Types','1cf86083-1024-4ace-a31d-ab4723365ab6','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','authenticated'),('ccbfbe7b-47fb-4b9c-8c24-a67ba75cba01','Max Clients Limit','1cf86083-1024-4ace-a31d-ab4723365ab6','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('da78154c-8ea0-4aeb-bc8c-6cafb2b28e95','Full Scope Disabled','875d0d7d-7037-4f48-9a40-1307264daea6','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('ddbc4539-e933-48a0-99eb-4cdb11f0cf9f','Max Clients Limit','875d0d7d-7037-4f48-9a40-1307264daea6','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','anonymous'),('ebf3d45d-0bb0-410e-9284-b8094c06fdca','Allowed Client Scopes','1cf86083-1024-4ace-a31d-ab4723365ab6','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','anonymous'),('f5675c76-d481-4701-beab-38df407b417b','hmac-generated','875d0d7d-7037-4f48-9a40-1307264daea6','hmac-generated','org.keycloak.keys.KeyProvider','875d0d7d-7037-4f48-9a40-1307264daea6',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00d1ac02-f5ad-4580-aeac-f58cc6d6f9cb','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('0e540a1e-03b8-4027-a915-af9a9528e6f6','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('109739a4-9c77-495f-b7d5-6b3df85eb033','9f742a3e-f8d3-4c01-beb1-81d00e1e6c86','algorithm','RSA-OAEP'),('125b761c-294e-4e71-b5d7-b364a1b479d1','6c96fabc-9114-4101-bdbe-7d7f46f73268','secret','sp30k69G-TsmZGtG_PVNUg'),('1bcd51a3-a6fa-497b-a53a-902f9816d46f','ddbc4539-e933-48a0-99eb-4cdb11f0cf9f','max-clients','200'),('1e6e4c9f-0e4b-459b-b094-4f039a1461c4','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('1f0f689b-3008-419d-9292-60b613d46127','aa29b8c0-8196-4009-96b9-0fa4e170024f','priority','100'),('24b7cea0-561b-4d82-9c95-e5c569fba290','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','oidc-full-name-mapper'),('24fe4ff4-7a23-43b6-8168-756f053eeefb','aa29b8c0-8196-4009-96b9-0fa4e170024f','keyUse','ENC'),('2a57adba-4e99-45f7-bf61-08a5bfb0c03e','aa29b8c0-8196-4009-96b9-0fa4e170024f','algorithm','RSA-OAEP'),('2c30d1f9-9f4b-4f77-99e2-29533b49caec','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','oidc-address-mapper'),('2eac29f8-e948-455f-99c1-2123faf44a59','48c6e54d-c688-41fb-b0b4-84e5022bfb40','priority','100'),('2ef5ca89-4609-4ce9-9592-ad7ec7b4b2a8','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','oidc-full-name-mapper'),('32e22ef7-aaa2-409c-8be0-f784b8cfcd1a','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('36cea167-67ef-485e-9ea7-f2d2fd3ea0d7','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3c1ea711-6309-4407-8354-8e2f4beb18d2','3b487b9b-9907-4404-a05b-4de2f87ec4fa','priority','100'),('3d79dd28-ddfb-4510-8666-3d4d76b85d51','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','oidc-full-name-mapper'),('40c50ccc-3f34-49bd-967f-5e24e25fbe08','f5675c76-d481-4701-beab-38df407b417b','kid','213aed19-1378-4f40-8268-33c853924a6c'),('41407301-c953-4baf-a870-c63e91523c23','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','oidc-address-mapper'),('527b5fa4-d981-4de5-9c48-5896ce44ba31','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','saml-user-property-mapper'),('5524a7f2-f4d4-4699-beaa-d996311594ec','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','saml-user-property-mapper'),('5b1ecd22-feac-4ad9-ac98-67ac18fa4e8f','f5675c76-d481-4701-beab-38df407b417b','priority','100'),('5cf74c8a-f18d-43a7-85e0-0b9fd532f0bd','1088998d-e101-4b7d-bc66-3878a1a1dcd6','allow-default-scopes','true'),('628fcdab-0e27-4e37-a7f5-9315ff931c09','9f742a3e-f8d3-4c01-beb1-81d00e1e6c86','privateKey','MIIEogIBAAKCAQEApbRqPBchSKKAxwnDcn+n4pxb2ed7nZrf5333v0yyjbj9WXh2C6VkFZW/foGw3G+bgaZg1DsEB002cL/xExAvAHpDMJZ3JmZgv/h/JkE9nB0bNw5vxc3g1OZrYVfc0YniBf0msW/QfzCXVu96CI4vuA0RIizk5/WLvuVUjmn6yAPUcBpf+nSPM8vm+z49lh7625MOK7FID6DYsMw/vZxF+Z9VY54oXjVMupJQTXrqs5vRNeMctgjqYmQiWN4WWxSp9DIwUMbVjpheqdR6GMJWKzx5p+5kdeoXxUTXbImkt0F9isOCIGTyrkdIvalGN5BAmazC2yWORZAH8b98NFK2awIDAQABAoIBAEmkL/BLoT2cBpouQx+QDwb9US66muvUh/xjtaZdSh8E3wcTq3aKhru3BNcOgRC+QwBv9ilrnuM10+Nw0g0UTKcsLs8Zl5NHvWijYbKZHO3T26PwtQjV8bz8OC2XNColWn8p3bfOhvz3ldKLdBL4ScnEeOBUzlgt/nCUj6sI+2xG2vVbSg1P2LxAWSoyc5jOD9oND1P3y8OD8vRTw1YZ/bdUTGIn77flkw9YnvieCXGh29nbt0j1a4e4qEIFohqiVDQKE4hd2xSZzAqFlrVqZTpiZcc9yxV4WC3r6tkJMbI60QKTHx73NVZLgPY6NBKwdAKep91fE4Nnhyv/rELN8qUCgYEA6UxrwIMd1fhMwWHx2mXhXNJJqTcfxhFKiECTgpm7GmlZzwmZtXSinK6XX1e2b6cBGsOqDN9ukkhHwwe3QM0Gkl84hvml70ljlMt8p/K9jHd2vi2UhrcbjgrS3TjRXgD1hVfkJwsxRsdxtoJeF1dNBEPtSN3dHL2m7vqv8V8yzf8CgYEAtdQzUKz+1iGvd9i8Zhz0fKXvT7O0b3d/zRf9gA7xwxVyQMGick6wlfFKB/2usxpkehdBP4HCjnJP8xgXRW0JpoKLpX7T1mxUXj8aBiE+vHMUiJpRaGTNbMBPt7xiPfi4IbDUd90JwqCGDwcqcryXC/KmEyokFiaJAC7GTjYRL5UCgYAUtf4S1xD8/9AAkutfkg/Rp7F2Xjhp4vsU4Xa272LW02dvo9CLdVFCS5WQlz7Q5qiIcbpU7jjor5X/UF4KWKkusVlZUixS89btTKtCVaBSKgDWnUFEPFkr4PYbQYIEsF0be1P7y1iSif4kT6p+s/dYW5djEp8ggA2jxYl9ChB+jQKBgGZ6z+Uza3myiJvqetyuixlJyKRKK3L7jftA/y5Sve3uw3M971mvghUwZkI0t2bYhDLPsoWhk88HHIptVIhbmSnQv/Ypkily6uYneHpl+F7sGXGYUDOfRKx7gzKSKWi2KslKSaW43cxk/smvhzwdkKA6RWHdyXL2ixagRkJEdNE1AoGAVc/CBCPEADsPJRwyrtPZpNI2+ceFHPKC956w4aHGQ0jiAwdDdXwQFkMMr14NbZDavR++aAk//efZrcLRdvuKWJTnzrjipEeAleGwkLK9VxxHhMAzNBLR4L3/M8+jjnJr1NIUzpcS+u7BTpdvVwNj/+Xwtw3pORT0UQ0wDflvcXY='),('654db064-97f3-44dd-83c8-0ff9216ffa1d','1dc00f4e-da90-4198-a49f-afa264708be4','client-uris-must-match','true'),('668c03d0-c172-48d3-afe4-df4968d7828b','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6d104ef8-8b50-49c2-8b0a-5f9bb603a7e0','48c6e54d-c688-41fb-b0b4-84e5022bfb40','secret','Pza6lzWJVsE5yY4oeOaVfw'),('70b8c17c-72a6-465c-b108-80d71ae2e366','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('7372490f-e2d0-46f3-8a17-b6adac7cf022','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','saml-role-list-mapper'),('74041061-f918-4382-a448-135505157435','aa29b8c0-8196-4009-96b9-0fa4e170024f','certificate','MIICmzCCAYMCBgGHcLxO9jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDExMTQzMTQxWhcNMzMwNDExMTQzMzIxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDOzDiUNjjG24wCqlbCem9sbXZFkWyEhjxFkEg4ZJoe7g510m8zT2mGnCIcSQuxc3b4Jx+l89zAfff4Be9dZUBPNEBuZw1ejfDp76qxPslGsBJu9o52X6K0TYro2rafd2iCuS53vp1Rq2tEwUlEMRivGV3duJlHGlPdbweuxsatyAd4PhxXskyLhgSp6E+bCiXtXyKeUaBn1+eG2HA9WS8j17aaA2JlxUkwL6uDUoAVxcC/snVJZpD40sLZFk2pFys9HF3msfzt8UmzqLXJZj8XnDRzF/dvlVuIcIAjCtaGDXlIIAXsZD4fPFrd7NAwgpAY1Q2HRx7nG6Srr7D8dBplAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAMW4kKWE3OO/0OJ9+vMBv2MQcyDM7HCXApDdxSkMa97kawtlHG67T00LHKZHRIk2RngSP6yaxtQcBW7XCWxgUFtD4DA/WsxXC6ZuaKlueDCEfkBPck+Bh8MN1i8CVJ54oV8edHRiaLdE8yDQBgkE+XeU4jX/Yq02IrAVD2X1YLCTdQg8FKwX1yYpw0TtRmX26yPyQ/kT9fm3ejP+SFtE6dO06DY8HP0CikUlnPDiWv2Ft8bc1StWfhnWTWpyIexVcuY3n39xQAWTyuwtUrCguk4D8BLll1GE9/patsFjZR8xB+qbEpwpmo4JnwArqT8NcV4GcO3KJ1vAz/zpJHU0O/U='),('745e52d5-9af5-4fe0-982a-034b1c948240','bd55f943-e39c-481f-97bf-4cd9043882aa','allow-default-scopes','true'),('749a050f-9a97-455a-b0e2-4aa44eab25c1','48c6e54d-c688-41fb-b0b4-84e5022bfb40','kid','ffdb5fb5-127e-4fcc-9635-3437c4cd2e93'),('78c9d08c-1677-4eb0-a800-030445447ce4','b9d35011-507c-4cd0-89b5-655cd82cced3','keyUse','SIG'),('793b85c9-c3ad-456c-8b16-c2e6c38d4307','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('87a2f408-a68b-4cf2-8dd8-b3b8923ac944','1dc00f4e-da90-4198-a49f-afa264708be4','host-sending-registration-request-must-match','true'),('8c2e92cf-06d4-4c29-8c19-1d5fb1ecb019','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','saml-user-property-mapper'),('8f6a7bce-2c14-4e00-93f7-0c0f3439ebbc','f5675c76-d481-4701-beab-38df407b417b','secret','R_wYdgIwjnsgxcIakRJ41JMugYWu8t963SGKbUQP5XECJDZJSjsyJXZkAnb9L4M-OhMnDi4tvKYz1k2VCQ9pKQ'),('90099a6c-aabd-446e-851c-418562cb78ae','4c949593-e9da-420e-a900-ba7dbce7b730','host-sending-registration-request-must-match','true'),('976cf070-a2db-4093-98cb-597c5fbd2d74','b9d35011-507c-4cd0-89b5-655cd82cced3','priority','100'),('997b7e20-c779-43ff-9b58-1d60604ac54a','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9c6d5d99-a238-4eeb-917a-9fe1f30eb9c4','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9dbc80bf-c11b-4314-a8e5-76281dd5190a','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('9f299227-c007-40b0-9882-f51a4f41d905','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','saml-user-property-mapper'),('a0b9d04d-8947-4e22-812d-f1433f8e8884','6c96fabc-9114-4101-bdbe-7d7f46f73268','kid','0546a211-78fb-4cb5-b7d1-bf669efb3a32'),('a10bd5ce-8383-436e-b602-45ec7f363421','9f742a3e-f8d3-4c01-beb1-81d00e1e6c86','certificate','MIICtzCCAZ8CBgGHcLxnMDANBgkqhkiG9w0BAQsFADAfMR0wGwYDVQQDDBRpbnN0aXR1dGUtbWFuYWdlbWVudDAeFw0yMzA0MTExNDMxNDhaFw0zMzA0MTExNDMzMjhaMB8xHTAbBgNVBAMMFGluc3RpdHV0ZS1tYW5hZ2VtZW50MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApbRqPBchSKKAxwnDcn+n4pxb2ed7nZrf5333v0yyjbj9WXh2C6VkFZW/foGw3G+bgaZg1DsEB002cL/xExAvAHpDMJZ3JmZgv/h/JkE9nB0bNw5vxc3g1OZrYVfc0YniBf0msW/QfzCXVu96CI4vuA0RIizk5/WLvuVUjmn6yAPUcBpf+nSPM8vm+z49lh7625MOK7FID6DYsMw/vZxF+Z9VY54oXjVMupJQTXrqs5vRNeMctgjqYmQiWN4WWxSp9DIwUMbVjpheqdR6GMJWKzx5p+5kdeoXxUTXbImkt0F9isOCIGTyrkdIvalGN5BAmazC2yWORZAH8b98NFK2awIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQB45SReNJoP0J3rdkX0CNeB8T9vPpAZDxaVPDPB7+zD7PPnxP7veIMFT9NewyDjR+KuPAWakBbNb5+Ze7O2y/kUagqC9rlX42jjM7s+ULTeLKkW/eMff5e2kixaQN1UEhYA4uuC9Exawppb0egeekPJytT9gTrJZNXb1VZgYNYBb5axRWa2YBaZjSUj6wPanchMc48O/jxe6A9mHJYcLaZZGD61YYyfudihUAPAmgnh6bKfWyH0heJlP529GKj/ZkexO0P8IyxiUIIpXorokMBLkaw9Ef2xoaBAVMcoSt6VCNgGB4ilEztq5LceRROuJaDo9d4urBG2Ozqej6cdNoN+'),('a21f4bae-cf52-4207-a097-3be2ff03618a','26bd5e4d-9331-4a06-b0c0-b4a528fa6cca','privateKey','MIIEowIBAAKCAQEAyqx7dXye9xCkRx2dETN5Nbpwl/6sit7FDyl6q/eoBLG6SltJBpNkwfvh18Jnu+xK3+J5/ml9xwsyUjKWDpRnAbaKqHnuRyWp9aYVuuB5LsjONZVV/dQWTlhHGObaYeQMai5T+xUki9YA80c7HUlz/nuyNfqC8wK18GBvbGq8htmT0arSIWX0818aufHqudjnOxrw6ZuezLL57QTJPI/TuOb/D07F7tT5AkoLs2bA6vLru+jTi9fuCJ2kPoiJ43nQOxK1sce4tDtnrtN14BGgdNKA/jgT0an5+XG9rNHxSXbfG3jbVhPM5Cu5HMV4guKManEohpxZ6uHo+r9hG35nzQIDAQABAoIBABXRHuIdBeStIS35mVqMarAWr3+hHdQ+GkLhUW/5ExhcRGQ0MuZ3D9nU4jEOX4nKbB3xHHY/R1eZlDNmeCI+Jd94lbEAnR6CBqtnkz/AYbMgURhSCMVv4u3QkWi0Ew6GFLMKZSZqVnqKESSfBpVGvqqGiL7IRnff0xN64guu6rfuOzFTwNUwTcVOaan8E55t7PknOHD0QUM/w+d9PyD2HvWUqin0CO97b39XsYrUVZZ0xKTPJDcWV68wg7rPzf+s6/1E2HMMxtM/Jk1iO0fzyX9+cZnp8P3BN6plFAd9+DHKB6xIw8jzLAE/58PFAA8nvQPHhQcfB3pc7RwQkMmdhxECgYEA/BHYgOTZ8s5mmH2DruZZkdW7zYxizPu4l2P79t80Y7vh/N0Z8Vd7zmAgbJi3AaPK58GLrtmdi9Hzp/WbOSQV7Aw/qvwNCFHFmj+ZD4wJni438/A9Q8mqRw6kn9Roemc2y7n+VMrWCpmSUEehcryLFwzy/2Evy7j/wO7ijRrkJj0CgYEAzdV4FReHUdZK5En1B4Ie7hURtxEHbJ597lVIaVc+I1nGd5K7tyufyHArYriIc2GGRNt//NXFCa3/Zn71QEq6egaRu/8tHhAkhDbFv0oq61vqbPagiqRoszHAt9H4kR6R/xEDWsOiPbC07uG5D928gROOOZj2Myc1ktT/mykK8NECgYBmIPDgYFix2NCWrhwBbBEUVk2uHVgWh1Kl+/ulbY/zbLdGVWribriZyDa66TEUuAFI3xEyObdsZBddkNRgVW+QYPIW2+KH4WG3elcQhoOLFFzVOBwKcBXOjm9C1rOyDEmWR3h1cG1ChDBU2IDgVOXh4/w8XmsYFo+A4wjldOTFXQKBgAWgAtMYvIL5Bzzr5H1bCftZqg1Fst0+C5T60arHTpRqvKjB4s1jrM8ueZEOF/SHQsMY+ItxUBwunB8x8wPZxvTUvyDTHWmH6WePk6HhpgCel2544vRG//F9t5WOcGuO2VCOJ3hQhluHO7qXgpYzahZg8W8Thg7p0GX92ipkWb8xAoGBAKX/KHIZGP+X6LWPK0j9S0kwhBDKdjkgd9jpNuL5/KWdWg34sq27tkHT2wLyWJOzq6T4kZ6fu44QjgNyetDiHCnx8muloTcF0XSRXufqUIchFhpXbugojUlt9/Ovw01eVJUms4rY2UpLMjL1IG3Ov7wXGneiyYiJ4vcIn1B3Mhtj'),('aa99ec73-8675-4957-b5f5-62f34c5e516f','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','saml-role-list-mapper'),('b040a6d4-f70b-47c7-ae30-1b6d9d3d5fe8','ccbfbe7b-47fb-4b9c-8c24-a67ba75cba01','max-clients','200'),('b1680feb-f7aa-48f5-a0ab-1d5a99d07d6d','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('bb507a95-16a9-4dc1-abdf-e2691d358eff','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('bbd0fbec-07f1-41e6-a635-95f93a427ead','3a926ba1-aa22-4450-9523-f81b8ccd3834','allow-default-scopes','true'),('bd7204ee-d864-404c-8f07-e451d7a66e8b','f5675c76-d481-4701-beab-38df407b417b','algorithm','HS256'),('bfdb66e4-e000-46ec-92f0-7bbec63e8223','4c949593-e9da-420e-a900-ba7dbce7b730','client-uris-must-match','true'),('c28928ae-6ab3-4e48-bcf8-089af4178379','3b487b9b-9907-4404-a05b-4de2f87ec4fa','secret','gJm0t8ett_5fZ4XQfsSv6NLXg2xlUuP8Y8CP3WbRaJwzIiIysgPs0-eLoedDaexTy_ThXJypZhJLUUv9-TvG4A'),('c477826e-c8b5-49fe-b8d1-706b9477502d','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','saml-role-list-mapper'),('c6163867-ff59-43fc-9665-81d03503df89','6c96fabc-9114-4101-bdbe-7d7f46f73268','priority','100'),('c9440bd4-3ccf-4830-a35a-63244bfa74dc','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','oidc-address-mapper'),('cb25c511-44cd-42d0-b253-dc9012029dc2','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ce479c31-2bad-4543-8bc8-ee2bc18258f8','3b487b9b-9907-4404-a05b-4de2f87ec4fa','algorithm','HS256'),('cf1a9258-1664-4d30-87d1-f2c875b61f44','26bd5e4d-9331-4a06-b0c0-b4a528fa6cca','certificate','MIICtzCCAZ8CBgGHcLxoFzANBgkqhkiG9w0BAQsFADAfMR0wGwYDVQQDDBRpbnN0aXR1dGUtbWFuYWdlbWVudDAeFw0yMzA0MTExNDMxNDhaFw0zMzA0MTExNDMzMjhaMB8xHTAbBgNVBAMMFGluc3RpdHV0ZS1tYW5hZ2VtZW50MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyqx7dXye9xCkRx2dETN5Nbpwl/6sit7FDyl6q/eoBLG6SltJBpNkwfvh18Jnu+xK3+J5/ml9xwsyUjKWDpRnAbaKqHnuRyWp9aYVuuB5LsjONZVV/dQWTlhHGObaYeQMai5T+xUki9YA80c7HUlz/nuyNfqC8wK18GBvbGq8htmT0arSIWX0818aufHqudjnOxrw6ZuezLL57QTJPI/TuOb/D07F7tT5AkoLs2bA6vLru+jTi9fuCJ2kPoiJ43nQOxK1sce4tDtnrtN14BGgdNKA/jgT0an5+XG9rNHxSXbfG3jbVhPM5Cu5HMV4guKManEohpxZ6uHo+r9hG35nzQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAdfpJxwSZUVq66q8ZTnl2Ks7HNwRWVlLyXVP2rtkhFP9fmINClbqeTOrH9T5OJqR5eZ8PJq4xWd0B65omlVIAuYFaD3OGbjJsoBf13Og+WIfazRaKiY3qSZLWUDFvP9fuGblQ76gWRzX4l+4co7IiUDuyelyLi9qfE65T/FWWTBVz1EbMIk3ntyCBsQEi7BBQR6+Pw70HF87EynvSvsOBVUHirv+M1+YvRQ5xlCYqURjjzeVHa7bmMievGNkk/6jmg1CGiilSy+1fUmGjqUPoW2EYjdFNWCyD+d6Ms8lrV8nvYjurvCjgyUaB14wNCaPhQkI0pnCqDwUI021+ocpRE'),('cf7b3c0b-0e7d-4457-8122-10bcbbc98223','458c66e6-e4d6-4c37-b5bf-c82b8c87721b','allowed-protocol-mapper-types','oidc-address-mapper'),('d35370b3-d32c-4601-909b-0383454d76c6','3b487b9b-9907-4404-a05b-4de2f87ec4fa','kid','db23e94b-4784-4c68-becc-5859ec597ef8'),('d99ae00d-c7c3-4bdb-a802-53c6664bf006','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('dee13d68-a760-4f27-b9be-3e1efc15dc2d','aa29b8c0-8196-4009-96b9-0fa4e170024f','privateKey','MIIEpAIBAAKCAQEAzsw4lDY4xtuMAqpWwnpvbG12RZFshIY8RZBIOGSaHu4OddJvM09phpwiHEkLsXN2+CcfpfPcwH33+AXvXWVATzRAbmcNXo3w6e+qsT7JRrASbvaOdl+itE2K6Nq2n3dogrkud76dUatrRMFJRDEYrxld3biZRxpT3W8HrsbGrcgHeD4cV7JMi4YEqehPmwol7V8inlGgZ9fnhthwPVkvI9e2mgNiZcVJMC+rg1KAFcXAv7J1SWaQ+NLC2RZNqRcrPRxd5rH87fFJs6i1yWY/F5w0cxf3b5VbiHCAIwrWhg15SCAF7GQ+Hzxa3ezQMIKQGNUNh0ce5xukq6+w/HQaZQIDAQABAoIBAA6GvBhgflis/jbct3dLSZg/UIN0AusEkTzItQ4DC8F4SEXrUtoy7e8ho2gYaHdzVywjdr699H0wDBMH0F005NF7fTrUHIAObpnG4axi2Zl7JPGsT5cN7OcHRbv0IHJvXUUbfsxfXyZ9aQL9edOjXZVv2Hm1QyJtEsQ3TaiaYsU9ALIC16rqfhBF9GSW0T8yVZopwnINu/VU1gwCF0zskPoLgrILAfqWQgMOzwZaZhQXrziCKKRMp2YVgvGSoBzBQCwBjyJKHm5IoJGzovVUz8o+FQgUL5GYAJY4Za82C/PYffiMLF3YYvE8uxio1b0Dlaijh9d1HDeeMIWnYkZOU7ECgYEA9TWqSP5cONs4kVfwM3oZvlKXd6I/t+LHBfP0W/64TnswF73+QbFsZ/Y14oennw7F6i6xnktN2lllZgEO2Dn9+foNhTDKW5RZL/FRyUHqhCVoWHy/QylqIuDHi75UxDOeVX7JwlrMJkVU2mQoRHxxGWkwKWhpIuRw2+e0xjhHxfECgYEA1+XWm0RYIYVAQd4Z36J9QlxX8ZTKKIWda7cAT6vPVvOBR11+c38E31rz1cE9oUSEFO4noe4dn6zuZZfK3NJ3FAG1mbWiyJUy8BEPnE+EO06OtXel7pssGwtzchm4FmpNfPP8TrefAn7BowiMHPBfORY9vg1mPCR95A4WvBc0l7UCgYEAg/P8DcmrUQFPQI+E9/6VyeBiGAPcrBTCKwbrkXHSNpF+ANjB8RIMFyncN2nunt5xTKMR++/kFkMTGMAq/9q9PH7+NZVa38tF71G6REZPcAs9Spjex8KKlfhGCYJD1U09wB45bngz8chPcDKDpM8egaEkRLQmF5u8y+m1UxHINdECgYADvuAPR4tD4Zzwx5qpT5devF1mOo+bTl4hzUX7G974Ajd+9ndIJ6789QX/8l9QWfD0sAEOBSSMbaKhLpX9aMVaGoF9DjKpyjTdB16+9n4zzTQan93IGvcT7Qnus9WGxgdcIJuC/hqLH4naez57DgyI4ALoNjFM39EzUK9CSiDGdQKBgQDpPQWcK3o9y5KArKMBb9kD6xfa0/wo3TY9qboDd4okoedoGZR9W5rArrsusS2GenM8B8tabiEPR/1zZkrjki4vz+S6GaGVsGQBhTlsvFHkgtZoc7ukll4VzPlHI4cr6IJ3oeV6yxEtBvm+4PmI0t9wRRuEcnQk2d989c3W+fi4vw=='),('e68983f8-bb21-45a1-b279-cbe1a2a38641','bf0e4ac8-3ee7-4372-8823-340bc56811b0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e7246c6d-03a4-4b23-9033-4b9037479950','ebf3d45d-0bb0-410e-9284-b8094c06fdca','allow-default-scopes','true'),('ea86ba2b-3d36-485b-8ac4-8b48302bb173','01372727-75c9-496f-a856-e6a7183605e6','allowed-protocol-mapper-types','saml-role-list-mapper'),('ef664c6c-a94a-4c1b-bbdb-836590aec95e','26bd5e4d-9331-4a06-b0c0-b4a528fa6cca','priority','100'),('ef7d2155-0b59-4a24-a437-fea00779d838','441773a5-e171-459a-b1fa-5f62479e4263','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('f121c55a-2abf-43d2-8a6e-96d5e353317b','b9d35011-507c-4cd0-89b5-655cd82cced3','certificate','MIICmzCCAYMCBgGHcLxNGTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDExMTQzMTQxWhcNMzMwNDExMTQzMzIxWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCg93i9B+cBBl1w3s3HNZljevwmmvknHNRkYh2NhY6YB44j/tPOHLuer/eqg7WVF0hTHF2sF7nql3gq6g/ML8+7NXLQ92fSU5eVTXpLHVhqqiyij3+G0lcspy0iD7nBqG8pK3ygI6dIM3DKg/VA9kWaAtuy/Bs/EOJGaBFcy6cJukgoMJU86WuKRHa3Quh0zgn1Yqo4jC/rbnT3xE5HXGYOAa2pQ34CXv+zH2kF1ooxC/TPyjGJaU+zfoeXn3+qdO55RMOPdJSo+DLrxesZLeuyovkA98HCDSRPH3bj0koUb5ULaaFGLEtenS9E1o1Bn4jthgTFgypGT4UoraY6OsUFAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACGqcXDM1GCTtJuxmPF072E68V3s8KJusKM6cfxxXyEIRW5C+2zzDaqSXtfM05ooQQixvH7vmNH6Dx0lGKgRs8FypHrlccmxdJ54LMa7xL9iZ4REDIpen3BIzcejKIgHwJk6yPSktQ67domEP6o9BZuZgScpzYu51tHGk3vshkapIM3HB0dELFPktWeBf30aSsQ9Pc4ud/kA2NLqCO7bgag4lUxD7fa4yKjaD+KieMBlyew7Ud/UDYFdXWzYHYiK+47VhyvA62P6YbViM9wqb2DHsvbRvQXlU1Pi/T8DXahLua7oSUFGcRg4UJsi3QihwAKrmR42PMKNcKbgibUNCgo='),('f66f67c7-e244-4708-ad98-08bb8290ad03','b9d35011-507c-4cd0-89b5-655cd82cced3','privateKey','MIIEogIBAAKCAQEAoPd4vQfnAQZdcN7NxzWZY3r8Jpr5JxzUZGIdjYWOmAeOI/7Tzhy7nq/3qoO1lRdIUxxdrBe56pd4KuoPzC/PuzVy0Pdn0lOXlU16Sx1Yaqosoo9/htJXLKctIg+5wahvKSt8oCOnSDNwyoP1QPZFmgLbsvwbPxDiRmgRXMunCbpIKDCVPOlrikR2t0LodM4J9WKqOIwv625098ROR1xmDgGtqUN+Al7/sx9pBdaKMQv0z8oxiWlPs36Hl59/qnTueUTDj3SUqPgy68XrGS3rsqL5APfBwg0kTx9249JKFG+VC2mhRixLXp0vRNaNQZ+I7YYExYMqRk+FKK2mOjrFBQIDAQABAoIBABF4T72DDjfGwefI+WAjDuxEl071/TpDqeuL2IruZreqWOt1h0sJ7vT97S0vpqAGoF4LfevPwWkBb9SHMG1n962TqKFJu2tmO3/uoj9lG8kBLN9RyrSjvzwEmDnnp1tU1V0MWrYjWHmrbOpAiyLgolTg9YjworZkCzg6qD5q3fdd+QQvvzIDSjpSktF37hRhmiWIE8y2aNpZ1f7sK6gMA7Q3aLMa/lvzSeUceHvwQg85XtIDE20o0309t/ysi6HoqLC6Ux2KmcEBdxunvsxxzc0NRCCSJIcFt7TwQK/JrSaK+GN6JxIk6lJB1QEwRETAvQvK5PmK/piP+CCZadv+OnsCgYEA249zugYAafmgDWCWpDDwlPNEMxTcI8XKay5g82Bc1sanD8qEWKXerLF3zX1o8PeY9mrW8qG0AShQevgMA1UjH/mpPYx62n/oS+2gqJGTg/vXu1IbxQcN8LLCctJ0x6izT1URKkOXoyJJCg2BZODDTwG9/NtgwT95Ejc+9AbcAmcCgYEAu66G51QFi2bNs04dtZ7VHjp9xTfSwjk7MfSkxbwRB8mHxtoGXKn5InIh31ycrNowVIy5antp0l2GAPjW3kqMNHW4q4mQKP3h96PwTOT0cMPZr1yDeBi9RnuL98+0QCvGStfKv1qXhQxH4w0qQ39BMGTrDYT87q2kmCAo3My50bMCgYBeAzjMaJF4zzhnQfp+5628OcX0EXSJpMGdz0gYLiTSmlEig9bTloKYc40W4iIzO/G1Yd4UGoVXEYoUfW23Z5cYs/BxuFtKgAZZrLBkPaFqnEWtoeTeIr0nWYPFYrQ6YdQVnhkxfavKYH3h3hKPvWYjyF0vjkgJt0ICOMGt/9no9QKBgHIWD09DVfN9VIEwdQLYQDiV2aou2uDRpVginJ7OSZPwP6bzFXbyo8z6j/iU9XBlWYer23IM/zCvRSwGF6ccrcmd3dn4Tzd7zQaaExLLAoQhqYvdstUoRLY5l8XV7n4rnegU8NwNF5n68x/j+tL44gmm7vNS6eW0jB8lPXGqyTHdAoGAK7EQ0uynap7Nirmcq7SYE7SLO009rRhPyUO8exwLejk7oj4nWdPzmA7XfD5Xiyf5c7bvpO9c/KbpUauwZkNbj3JgvGutLTkzf7BdgQSQWHwFLRimvpHGQADxDyLLtygd7QzkRVGrNoWJ7ksk6hrA2bL/lpuEE2nFHKmprneghHM='),('f7068ca5-0681-4a07-b15f-20bd5e224001','9f742a3e-f8d3-4c01-beb1-81d00e1e6c86','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1b8bc9ba-d535-4d88-bd94-b485a4c0b62e','51514013-bf40-4f36-a566-f4b9af79cf6f'),('1ceabb71-222b-4190-a150-510a0f693e00','2c201297-74ae-4575-96f0-2364006df9c5'),('1ceabb71-222b-4190-a150-510a0f693e00','9fcec60a-d9fc-4706-84ac-05b15b1da871'),('1ceabb71-222b-4190-a150-510a0f693e00','c6cb523d-0dea-487c-b82d-9d3536389167'),('1ceabb71-222b-4190-a150-510a0f693e00','fe558042-79e0-442a-b7d5-68836c6f4a96'),('42f203ad-8e47-4791-b7cd-b793a61b5c4c','dd2537dc-ebbf-4dcc-95c8-a8ed57d064e4'),('56ad0191-c5b4-4908-a61b-95d534008cfa','2a18f1dd-e9b4-420d-b820-e03ba9656aa7'),('6494f5e8-6071-4660-ba48-c969a9d4ffc3','4498f2ec-ed25-4436-8964-c457a82ba992'),('6494f5e8-6071-4660-ba48-c969a9d4ffc3','4d4dc98f-fff2-44eb-8729-083eedfeef85'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','005626ab-3978-4978-aca4-3699a5fe2d1f'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','04fd0638-6234-4ea3-a34b-e839ac4b8e50'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','066bb51b-b9cd-40b8-b8fc-62ade1015507'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','0817f4c8-c1f1-47dd-8874-4261d677972a'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','0c48ce38-6104-4ff2-b570-3342603c580c'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','0e591f4a-a862-4d9b-aa06-3530e10b33da'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','11e83b92-9639-473e-aa7d-a302cb6c071e'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','19e31d1a-5b8e-487d-8c32-4b7a925b8fe4'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','29d6451b-eebf-454d-8b0c-27072c5d9396'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','2a18f1dd-e9b4-420d-b820-e03ba9656aa7'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','39f54c88-11c2-4515-ac98-3d4d70419bc6'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','3a1c57f4-1bbc-4723-86c6-c7aa79e48ecd'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','3accd4ba-1440-4e02-a140-6e22517300e3'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','3bf25ef9-b901-474e-807a-a90b097da04d'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','4431219f-5daa-42f6-a499-edf0764a9f8f'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','4a665f20-6a13-4db5-b0b6-186270972f69'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','51c8c2c2-0ff0-498b-b7da-66cdb8f0c835'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','56ad0191-c5b4-4908-a61b-95d534008cfa'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','5b84f73f-a3b7-4a5c-970e-f6f89a227f5d'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','66eee077-e4bf-4187-9cf6-184e126a6879'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','75cd99d8-b062-48fc-88a9-d1a079575f9c'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','7dd162da-210a-4a4e-879b-dff79b57823d'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','92dcc8f6-9b64-4b3b-8e03-08ee1cf0f44c'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','99ea49ed-77b7-46b5-9759-948cdd436b01'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','b368859c-39ce-4dc6-a045-4f0246e083ec'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','b82e6790-0f3d-4cca-a040-45e0b42bc1f9'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','c0085792-4509-4e93-ab3c-326c7a3c2c45'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','c27706ed-869e-4d4d-85d5-ca50d65c3f3d'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','c5f4a789-26a8-48e0-832f-44a50b1a6ab3'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','d42c67c3-77e7-4245-9866-f558d626abc4'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','d5a49f25-f710-4373-8299-de70a0a6ab69'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','d633335a-6a12-479f-ac7e-22bfa21d13b6'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','f254a40c-aae1-426d-8e45-8945b87f2dd9'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','f2b55ae6-814b-45eb-845c-ca561cbe074f'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','f2e08d13-4ece-45a4-abe1-59ed2e964252'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','fd6b989b-7e59-4c5a-9f55-f059fe8e344f'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','feda7957-2515-4c2c-b548-4e8007a82a96'),('918d3498-505e-4c44-bbb6-fbd2d7244f55','da35cf78-ca8f-47c4-bcd9-3afa86d5a354'),('c5f4a789-26a8-48e0-832f-44a50b1a6ab3','29d6451b-eebf-454d-8b0c-27072c5d9396'),('c5f4a789-26a8-48e0-832f-44a50b1a6ab3','39f54c88-11c2-4515-ac98-3d4d70419bc6'),('c6cb523d-0dea-487c-b82d-9d3536389167','d7fd513d-a7be-4e63-abc6-65e923768ae0'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','1b3e569f-b675-4903-afbb-e2a9d0c95f96'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','208ea27d-70a3-42a5-92d5-75734b046904'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','23b99e0e-61e7-4bc3-93ea-d4d2d1c42e85'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','258b03cb-1498-4992-8063-0b2895e1e18f'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','30020238-ca6e-41fb-b60b-39d6c23363c3'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','34e26e61-9c56-4799-b0e5-adc730e41e22'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','4498f2ec-ed25-4436-8964-c457a82ba992'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','4d4dc98f-fff2-44eb-8729-083eedfeef85'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','6494f5e8-6071-4660-ba48-c969a9d4ffc3'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','65deca55-6329-4bd4-8b7c-0b124244d6cf'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','6c60a1ae-8394-4659-a67c-aa89c26f224b'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','918d3498-505e-4c44-bbb6-fbd2d7244f55'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','989f35c0-2c60-414e-b449-831ae5309e3d'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','9cdcd62a-3877-4069-9c77-71ae90384019'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','bd0abc4c-cb0f-40c0-9297-7c982dc46007'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','da35cf78-ca8f-47c4-bcd9-3afa86d5a354'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','e0d33389-5a6d-420c-afc2-a1c8397da085'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','ef4493a8-35af-4a61-9308-681e5f53a84d'),('d5a49f25-f710-4373-8299-de70a0a6ab69','066bb51b-b9cd-40b8-b8fc-62ade1015507'),('e31adcf7-6b41-4d32-b6dc-12168578514b','6ea7a60a-fee4-4584-9123-bb5c57435f4a'),('e754152c-1bca-42ec-be41-ecde82802147','2c0765e1-fa9f-413a-b191-e9a1088f8954'),('e754152c-1bca-42ec-be41-ecde82802147','6df700b8-9f25-4a69-a8ef-571a9a5a2b86'),('e754152c-1bca-42ec-be41-ecde82802147','76ac3863-0d28-4ed9-a81b-9a63bc979db6'),('e754152c-1bca-42ec-be41-ecde82802147','e31adcf7-6b41-4d32-b6dc-12168578514b'),('f2e08d13-4ece-45a4-abe1-59ed2e964252','11e83b92-9639-473e-aa7d-a302cb6c071e'),('f2e08d13-4ece-45a4-abe1-59ed2e964252','3accd4ba-1440-4e02-a140-6e22517300e3');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('508c5dd4-c96a-4c50-bfd2-1a9034f87d7a',NULL,'password','bd379fa3-ef10-4259-832b-b2de23854c9e',1681230636426,NULL,'{\"value\":\"e+Aum/o5TMbvK1SRRrCYG4hRpLbSoBWS5hKbkmtBXtp+mNQM06Rwbe8lIFmJ7Yjne4n9yPpp6Oa7HIggv1lFFA==\",\"salt\":\"OKioK0Ws6Il7eYAMDsSRyw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a859c952-d0a6-4eb1-83ad-a66dd509b827',NULL,'password','2261d932-28ba-49c5-8cee-aef269f80cf0',1681223609963,NULL,'{\"value\":\"npl+YAdo+klE+UP4qNJu59rm9VUlSmjW/Q4ePFLPf46g+309lGQ+dxZU53rxFQHF7WscLJtp7RcezbUaZwzGFQ==\",\"salt\":\"dxPy3zEd1U8SVenS7lr1WA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-04-11 14:32:34',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-04-11 14:32:34',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-04-11 14:32:35',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-04-11 14:32:35',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-04-11 14:32:39',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-04-11 14:32:39',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-04-11 14:32:42',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-04-11 14:32:42',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-04-11 14:32:42',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-04-11 14:32:45',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-04-11 14:32:46',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-04-11 14:32:46',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-04-11 14:32:46',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-11 14:32:47',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-11 14:32:47',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-11 14:32:47',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-04-11 14:32:47',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-04-11 14:32:49',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-04-11 14:32:50',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-04-11 14:32:50',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-04-11 14:32:50',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-04-11 14:32:50',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-04-11 14:32:51',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-04-11 14:32:51',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-04-11 14:32:51',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-04-11 14:32:52',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-04-11 14:32:54',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-04-11 14:32:54',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-04-11 14:32:56',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-04-11 14:32:57',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-04-11 14:32:58',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-04-11 14:32:58',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-11 14:32:58',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-11 14:32:58',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-11 14:33:01',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-04-11 14:33:01',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-04-11 14:33:01',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1223547955'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-04-11 14:33:01',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-04-11 14:33:01',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-11 14:33:01',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-11 14:33:01',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-04-11 14:33:01',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-04-11 14:33:03',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-04-11 14:33:03',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-11 14:33:03',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-11 14:33:03',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-11 14:33:04',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-11 14:33:05',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-04-11 14:33:05',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-04-11 14:33:07',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-04-11 14:33:07',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-04-11 14:33:07',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-04-11 14:33:07',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-04-11 14:33:07',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-11 14:33:08',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-11 14:33:08',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-11 14:33:09',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-04-11 14:33:12',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-04-11 14:33:13',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-04-11 14:33:13',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-04-11 14:33:13',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-04-11 14:33:13',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-04-11 14:33:13',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-04-11 14:33:13',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-04-11 14:33:13',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-04-11 14:33:14',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-04-11 14:33:14',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-04-11 14:33:14',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-04-11 14:33:14',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-04-11 14:33:14',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1223547955'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-04-11 14:33:14',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.8.0',NULL,NULL,'1223547955'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-11 14:33:14',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-11 14:33:14',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-11 14:33:14',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-11 14:33:15',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-04-11 14:33:15',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-11 14:33:15',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-11 14:33:15',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-11 14:33:16',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-04-11 14:33:16',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-11 14:33:16',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-11 14:33:16',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-11 14:33:16',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-11 14:33:16',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1223547955'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-04-11 14:33:16',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-04-11 14:33:16',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.8.0',NULL,NULL,'1223547955'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-04-11 14:33:16',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-04-11 14:33:17',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.8.0',NULL,NULL,'1223547955'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1223547955'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'1223547955'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-04-11 14:33:17',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1223547955'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-04-11 14:33:17',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-04-11 14:33:18',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.8.0',NULL,NULL,'1223547955'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2023-04-11 14:33:18',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2023-04-11 14:33:18',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1223547955'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2023-04-11 14:33:18',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.8.0',NULL,NULL,'1223547955'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-11 14:33:18',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-11 14:33:18',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1223547955'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2023-04-11 14:33:18',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1223547955');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('1cf86083-1024-4ace-a31d-ab4723365ab6','008a04d0-5c34-4b3e-b031-43c45cf7202c',_binary ''),('1cf86083-1024-4ace-a31d-ab4723365ab6','17bc2cd4-8e3f-4449-887d-becb2c6a546b',_binary '\0'),('1cf86083-1024-4ace-a31d-ab4723365ab6','1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95',_binary '\0'),('1cf86083-1024-4ace-a31d-ab4723365ab6','5d3129cc-92b4-4020-9fd9-edacbfe3073d',_binary ''),('1cf86083-1024-4ace-a31d-ab4723365ab6','6a4813f2-a0dc-4ad3-a608-379970f6f4e0',_binary '\0'),('1cf86083-1024-4ace-a31d-ab4723365ab6','6ad43d37-8d90-48ee-8514-f12034ca4b0d',_binary '\0'),('1cf86083-1024-4ace-a31d-ab4723365ab6','88a5fc39-b110-4796-a5a7-480073f6add5',_binary ''),('1cf86083-1024-4ace-a31d-ab4723365ab6','c1c391be-f3e8-4e31-8055-5798d79ab1db',_binary ''),('1cf86083-1024-4ace-a31d-ab4723365ab6','ee6860a5-0273-4f73-ac3e-6933e304ac4e',_binary ''),('1cf86083-1024-4ace-a31d-ab4723365ab6','f667aa97-8da8-4be8-9da6-9eee68083db7',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','1e25fbda-1c11-4eb2-8590-f0089d25bbf0',_binary '\0'),('875d0d7d-7037-4f48-9a40-1307264daea6','3c5d8407-4620-4164-b891-c0f1be5c9330',_binary '\0'),('875d0d7d-7037-4f48-9a40-1307264daea6','3ded8a6b-e2df-4dea-9e3c-161866541751',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','7609e4ee-99ff-4627-bf2a-45c628fd9740',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','77fbbf0a-1b5f-45f4-b26d-033361dadee5',_binary '\0'),('875d0d7d-7037-4f48-9a40-1307264daea6','7b8d28a6-e8ed-4977-b397-2aaface17d9f',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','7e712399-33c0-4581-b084-1081b1a15625',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','b4a230e2-0ac9-4c02-8b48-ac330255e043',_binary ''),('875d0d7d-7037-4f48-9a40-1307264daea6','fe45ed2a-5279-4596-8ce4-08e70f9f38c8',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('005626ab-3978-4978-aca4-3699a5fe2d1f','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-authorization}','manage-authorization','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('04fd0638-6234-4ea3-a34b-e839ac4b8e50','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-realm}','view-realm','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('066bb51b-b9cd-40b8-b8fc-62ade1015507','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_query-clients}','query-clients','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('0817f4c8-c1f1-47dd-8874-4261d677972a','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-identity-providers}','view-identity-providers','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('0c48ce38-6104-4ff2-b570-3342603c580c','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_impersonation}','impersonation','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('0e591f4a-a862-4d9b-aa06-3530e10b33da','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-authorization}','manage-authorization','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('11e83b92-9639-473e-aa7d-a302cb6c071e','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_query-users}','query-users','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('19e31d1a-5b8e-487d-8c32-4b7a925b8fe4','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-clients}','manage-clients','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('1b3e569f-b675-4903-afbb-e2a9d0c95f96','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-identity-providers}','view-identity-providers','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('1b8bc9ba-d535-4d88-bd94-b485a4c0b62e','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_manage-consent}','manage-consent','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('1ceabb71-222b-4190-a150-510a0f693e00','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0','${role_default-roles}','default-roles-master','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,NULL),('208ea27d-70a3-42a5-92d5-75734b046904','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-authorization}','manage-authorization','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('23b99e0e-61e7-4bc3-93ea-d4d2d1c42e85','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-users}','manage-users','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('258b03cb-1498-4992-8063-0b2895e1e18f','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_impersonation}','impersonation','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('29d6451b-eebf-454d-8b0c-27072c5d9396','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_query-groups}','query-groups','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('2a18f1dd-e9b4-420d-b820-e03ba9656aa7','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_query-clients}','query-clients','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('2c0765e1-fa9f-413a-b191-e9a1088f8954','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '\0','${role_uma_authorization}','uma_authorization','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL,NULL),('2c201297-74ae-4575-96f0-2364006df9c5','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0','${role_offline-access}','offline_access','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,NULL),('30020238-ca6e-41fb-b60b-39d6c23363c3','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_create-client}','create-client','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('34e26e61-9c56-4799-b0e5-adc730e41e22','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-realm}','view-realm','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('39f54c88-11c2-4515-ac98-3d4d70419bc6','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_query-users}','query-users','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('3a1c57f4-1bbc-4723-86c6-c7aa79e48ecd','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_create-client}','create-client','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('3accd4ba-1440-4e02-a140-6e22517300e3','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_query-groups}','query-groups','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('3bf25ef9-b901-474e-807a-a90b097da04d','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-users}','manage-users','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('40e479fe-5346-47c6-936f-98278f889c9c','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_view-applications}','view-applications','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('42f203ad-8e47-4791-b7cd-b793a61b5c4c','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_manage-consent}','manage-consent','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('4431219f-5daa-42f6-a499-edf0764a9f8f','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-identity-providers}','manage-identity-providers','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('4498f2ec-ed25-4436-8964-c457a82ba992','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_query-groups}','query-groups','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('4a665f20-6a13-4db5-b0b6-186270972f69','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-realm}','manage-realm','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('4d4dc98f-fff2-44eb-8729-083eedfeef85','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_query-users}','query-users','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('4db75efa-8204-4fe8-9ddf-b337126adeb2','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_view-groups}','view-groups','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('4ead7531-1a56-4264-853f-502a06468313','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_view-applications}','view-applications','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('51514013-bf40-4f36-a566-f4b9af79cf6f','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_view-consent}','view-consent','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('51c8c2c2-0ff0-498b-b7da-66cdb8f0c835','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_impersonation}','impersonation','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('56ad0191-c5b4-4908-a61b-95d534008cfa','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-clients}','view-clients','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('594cfd22-539b-43a3-afd8-a4662aa52568','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_delete-account}','delete-account','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('5b84f73f-a3b7-4a5c-970e-f6f89a227f5d','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-events}','manage-events','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('6494f5e8-6071-4660-ba48-c969a9d4ffc3','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-users}','view-users','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('65deca55-6329-4bd4-8b7c-0b124244d6cf','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-clients}','manage-clients','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('66eee077-e4bf-4187-9cf6-184e126a6879','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-events}','view-events','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('6c60a1ae-8394-4659-a67c-aa89c26f224b','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-authorization}','view-authorization','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('6df700b8-9f25-4a69-a8ef-571a9a5a2b86','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_view-profile}','view-profile','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('6ea7a60a-fee4-4584-9123-bb5c57435f4a','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_manage-account-links}','manage-account-links','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('75cd99d8-b062-48fc-88a9-d1a079575f9c','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_query-realms}','query-realms','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('76ac3863-0d28-4ed9-a81b-9a63bc979db6','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '\0','${role_offline-access}','offline_access','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL,NULL),('7710bf33-d7d4-48eb-8178-810ea7809ed0','82111ee4-3fa2-48d9-8e67-888bf357bb07',_binary '','${role_read-token}','read-token','875d0d7d-7037-4f48-9a40-1307264daea6','82111ee4-3fa2-48d9-8e67-888bf357bb07',NULL),('7dd162da-210a-4a4e-879b-dff79b57823d','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-authorization}','view-authorization','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0','${role_admin}','admin','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,NULL),('918d3498-505e-4c44-bbb6-fbd2d7244f55','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-clients}','view-clients','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('92dcc8f6-9b64-4b3b-8e03-08ee1cf0f44c','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-events}','manage-events','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('989f35c0-2c60-414e-b449-831ae5309e3d','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-realm}','manage-realm','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('99ea49ed-77b7-46b5-9759-948cdd436b01','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-identity-providers}','view-identity-providers','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('9cdcd62a-3877-4069-9c77-71ae90384019','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-identity-providers}','manage-identity-providers','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('9fcec60a-d9fc-4706-84ac-05b15b1da871','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0','${role_uma_authorization}','uma_authorization','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,NULL),('a28caf4e-c61f-4299-b1a6-f5eb74b9727b','cb0ce7bb-dd8a-4d62-b545-d744e5839931',_binary '','${role_read-token}','read-token','1cf86083-1024-4ace-a31d-ab4723365ab6','cb0ce7bb-dd8a-4d62-b545-d744e5839931',NULL),('af555bee-29a2-4248-a4cb-e9ad7b9d8e5c','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',_binary '',NULL,'uma_protection','1cf86083-1024-4ace-a31d-ab4723365ab6','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',NULL),('b368859c-39ce-4dc6-a045-4f0246e083ec','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_manage-identity-providers}','manage-identity-providers','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('b82e6790-0f3d-4cca-a040-45e0b42bc1f9','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_query-realms}','query-realms','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('bd0abc4c-cb0f-40c0-9297-7c982dc46007','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_view-events}','view-events','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('c0085792-4509-4e93-ab3c-326c7a3c2c45','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-realm}','manage-realm','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('c27706ed-869e-4d4d-85d5-ca50d65c3f3d','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-events}','view-events','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('c5f4a789-26a8-48e0-832f-44a50b1a6ab3','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_view-users}','view-users','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('c6cb523d-0dea-487c-b82d-9d3536389167','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_manage-account}','manage-account','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_realm-admin}','realm-admin','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('d42c67c3-77e7-4245-9866-f558d626abc4','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_create-client}','create-client','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('d5a49f25-f710-4373-8299-de70a0a6ab69','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-clients}','view-clients','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('d633335a-6a12-479f-ac7e-22bfa21d13b6','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-clients}','manage-clients','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('d7fd513d-a7be-4e63-abc6-65e923768ae0','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_manage-account-links}','manage-account-links','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('da35cf78-ca8f-47c4-bcd9-3afa86d5a354','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_query-clients}','query-clients','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('dd2537dc-ebbf-4dcc-95c8-a8ed57d064e4','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_view-consent}','view-consent','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('e0d33389-5a6d-420c-afc2-a1c8397da085','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_manage-events}','manage-events','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('e31adcf7-6b41-4d32-b6dc-12168578514b','1407631e-e679-4cff-83b6-ee30e436ae4d',_binary '','${role_manage-account}','manage-account','1cf86083-1024-4ace-a31d-ab4723365ab6','1407631e-e679-4cff-83b6-ee30e436ae4d',NULL),('e629199f-a488-4c6d-adb1-491f38090e44','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_delete-account}','delete-account','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('e754152c-1bca-42ec-be41-ecde82802147','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '\0','${role_default-roles}','default-roles-institute-management','1cf86083-1024-4ace-a31d-ab4723365ab6',NULL,NULL),('ef4493a8-35af-4a61-9308-681e5f53a84d','98f58e78-360d-4236-bbe3-c1ac5c90ae67',_binary '','${role_query-realms}','query-realms','1cf86083-1024-4ace-a31d-ab4723365ab6','98f58e78-360d-4236-bbe3-c1ac5c90ae67',NULL),('f254a40c-aae1-426d-8e45-8945b87f2dd9','201b787c-2f22-4495-9581-ff0dc5485d15',_binary '','${role_manage-users}','manage-users','875d0d7d-7037-4f48-9a40-1307264daea6','201b787c-2f22-4495-9581-ff0dc5485d15',NULL),('f2b55ae6-814b-45eb-845c-ca561cbe074f','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0','${role_create-realm}','create-realm','875d0d7d-7037-4f48-9a40-1307264daea6',NULL,NULL),('f2e08d13-4ece-45a4-abe1-59ed2e964252','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-users}','view-users','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('fd6b989b-7e59-4c5a-9f55-f059fe8e344f','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-realm}','view-realm','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('fe558042-79e0-442a-b7d5-68836c6f4a96','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_view-profile}','view-profile','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL),('feda7957-2515-4c2c-b548-4e8007a82a96','81123f05-0cf2-46bd-b502-9b69b4b38987',_binary '','${role_view-authorization}','view-authorization','875d0d7d-7037-4f48-9a40-1307264daea6','81123f05-0cf2-46bd-b502-9b69b4b38987',NULL),('ff41c670-c597-4bcb-a495-b9d5cfcb991c','d26c2010-74ab-4211-b1a2-b0a3a7056c26',_binary '','${role_view-groups}','view-groups','875d0d7d-7037-4f48-9a40-1307264daea6','d26c2010-74ab-4211-b1a2-b0a3a7056c26',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('hhxo9','20.0.1',1681223598);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fe45ed2a-5279-4596-8ce4-08e70f9f38c8'),('0be0c80f-d352-4d38-b228-654d86ffef54','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('0fc67639-cca8-405f-8963-9835dd70b69b','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('11500cc6-513a-4d52-988c-da3952e89ff0','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'7b8d28a6-e8ed-4977-b397-2aaface17d9f'),('13860754-e981-48dc-a078-ed954ade2745','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('17a2a345-71c6-4f0a-be5a-7b0801f5efe4','full name','openid-connect','oidc-full-name-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('1cdf1144-a416-47a3-a982-4304cb78b35e','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'88a5fc39-b110-4796-a5a7-480073f6add5'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','address','openid-connect','oidc-address-mapper',NULL,'6ad43d37-8d90-48ee-8514-f12034ca4b0d'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','username','openid-connect','oidc-usermodel-property-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'008a04d0-5c34-4b3e-b031-43c45cf7202c'),('3a90b956-68c9-4017-ba69-e297a852d9ff','role list','saml','saml-role-list-mapper',NULL,'3ded8a6b-e2df-4dea-9e3c-161866541751'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('42bcd774-613c-4a21-9f2b-3ff562536a31','acr loa level','openid-connect','oidc-acr-mapper',NULL,'f667aa97-8da8-4be8-9da6-9eee68083db7'),('456853d9-e35d-469c-a056-c8b7af45bb26','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'008a04d0-5c34-4b3e-b031-43c45cf7202c'),('4d3c0392-503a-4022-9e9f-4950f981241c','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',NULL),('58aeddc5-6cd3-42f2-8b15-a892842885e5','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'1c8b9014-e9f2-408d-a9cc-0a0ff8ab1f95'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'fe45ed2a-5279-4596-8ce4-08e70f9f38c8'),('6d4517a2-5bf1-496c-8c22-1d4299544622','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('6e1ce93a-8853-4af6-9217-626d16db39e0','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('6fad7215-89d4-45e4-af2d-90a3da80def9','audience resolve','openid-connect','oidc-audience-resolve-mapper','6bbad496-2df1-4ff6-8639-fd89936c8605',NULL),('739a46b3-c5ba-47ec-bdd9-4909b0777014','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'008a04d0-5c34-4b3e-b031-43c45cf7202c'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'7b8d28a6-e8ed-4977-b397-2aaface17d9f'),('779a73a9-0588-4c18-99b6-1cef68af4514','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'1e25fbda-1c11-4eb2-8590-f0089d25bbf0'),('7c91a6bb-b0e7-4a96-8f8b-2a04434383fb','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'7f6d2adb-87ea-49bc-87d9-d7a6c007f7fc'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','address','openid-connect','oidc-address-mapper',NULL,'3c5d8407-4620-4164-b891-c0f1be5c9330'),('823499c5-d6cb-46ad-83f7-18bad335967d','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('8fc68706-62a3-4d35-8133-4c4048c7039a','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',NULL),('92545574-8b4a-4d54-b81b-104211692e9c','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1e25fbda-1c11-4eb2-8590-f0089d25bbf0'),('92ae5b4b-8853-4fd0-a2c7-427420449fc8','acr loa level','openid-connect','oidc-acr-mapper',NULL,'b4a230e2-0ac9-4c02-8b48-ac330255e043'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'c1c391be-f3e8-4e31-8055-5798d79ab1db'),('9ed583da-0c2a-4a3e-827e-744f92a19030','locale','openid-connect','oidc-usermodel-attribute-mapper','92e9743c-4142-4eb3-9c0f-8a37c359ebb2',NULL),('a5a76443-d2ea-48e8-8257-36f5440a5e73','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('aa661498-de91-4755-a23b-f9a7848abedc','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'7e712399-33c0-4581-b084-1081b1a15625'),('b9aedb3e-1756-48f3-afaf-1fd821d696cf','audience resolve','openid-connect','oidc-audience-resolve-mapper','7763a689-4032-44df-acf1-3931c2e34202',NULL),('c06895c5-813a-40c2-be70-12fedc7ca827','full name','openid-connect','oidc-full-name-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('c430434e-a764-46ea-8e28-c5c88d619fc6','role list','saml','saml-role-list-mapper',NULL,'5d3129cc-92b4-4020-9fd9-edacbfe3073d'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('c650558e-3bfe-4850-8e04-cadacc82b44f','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'17bc2cd4-8e3f-4449-887d-becb2c6a546b'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'17bc2cd4-8e3f-4449-887d-becb2c6a546b'),('cbbab083-820b-47cb-a92a-c02b09df0f19','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('d5005371-f7e5-423e-b941-d339e0094494','locale','openid-connect','oidc-usermodel-attribute-mapper','83ae6f59-7c8b-4115-872f-9526bacecefa',NULL),('db0c1f63-5958-4515-940c-f18b7cb2c794','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('de6e0a88-047e-47aa-a99d-92ca46d496da','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7b8d28a6-e8ed-4977-b397-2aaface17d9f'),('f3f1b848-5aa0-4107-bae4-715d34235982','email','openid-connect','oidc-usermodel-property-mapper',NULL,'7e712399-33c0-4581-b084-1081b1a15625'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',NULL),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','username','openid-connect','oidc-usermodel-property-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('fb798582-d9d9-42cc-9150-5d04d905bffa','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'7609e4ee-99ff-4627-bf2a-45c628fd9740'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','email','openid-connect','oidc-usermodel-property-mapper',NULL,'c1c391be-f3e8-4e31-8055-5798d79ab1db'),('fdcb090e-0998-4372-8b56-670734a806bb','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'ee6860a5-0273-4f73-ac3e-6933e304ac4e');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','true','access.token.claim'),('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','phone_number','claim.name'),('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','true','id.token.claim'),('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','String','jsonType.label'),('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','phoneNumber','user.attribute'),('02989716-a4f6-4e9e-a9bd-62e368c3a5eb','true','userinfo.token.claim'),('0be0c80f-d352-4d38-b228-654d86ffef54','true','access.token.claim'),('0be0c80f-d352-4d38-b228-654d86ffef54','picture','claim.name'),('0be0c80f-d352-4d38-b228-654d86ffef54','true','id.token.claim'),('0be0c80f-d352-4d38-b228-654d86ffef54','String','jsonType.label'),('0be0c80f-d352-4d38-b228-654d86ffef54','picture','user.attribute'),('0be0c80f-d352-4d38-b228-654d86ffef54','true','userinfo.token.claim'),('0fc67639-cca8-405f-8963-9835dd70b69b','true','access.token.claim'),('0fc67639-cca8-405f-8963-9835dd70b69b','updated_at','claim.name'),('0fc67639-cca8-405f-8963-9835dd70b69b','true','id.token.claim'),('0fc67639-cca8-405f-8963-9835dd70b69b','long','jsonType.label'),('0fc67639-cca8-405f-8963-9835dd70b69b','updatedAt','user.attribute'),('0fc67639-cca8-405f-8963-9835dd70b69b','true','userinfo.token.claim'),('13860754-e981-48dc-a078-ed954ade2745','true','access.token.claim'),('13860754-e981-48dc-a078-ed954ade2745','website','claim.name'),('13860754-e981-48dc-a078-ed954ade2745','true','id.token.claim'),('13860754-e981-48dc-a078-ed954ade2745','String','jsonType.label'),('13860754-e981-48dc-a078-ed954ade2745','website','user.attribute'),('13860754-e981-48dc-a078-ed954ade2745','true','userinfo.token.claim'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','true','access.token.claim'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','birthdate','claim.name'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','true','id.token.claim'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','String','jsonType.label'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','birthdate','user.attribute'),('16c430d3-a357-424d-b6dd-fea7d9a65f1b','true','userinfo.token.claim'),('17a2a345-71c6-4f0a-be5a-7b0801f5efe4','true','access.token.claim'),('17a2a345-71c6-4f0a-be5a-7b0801f5efe4','true','id.token.claim'),('17a2a345-71c6-4f0a-be5a-7b0801f5efe4','true','userinfo.token.claim'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','true','access.token.claim'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','zoneinfo','claim.name'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','true','id.token.claim'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','String','jsonType.label'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','zoneinfo','user.attribute'),('1a1d2cff-631e-4a99-8d44-1da0dcc61e6f','true','userinfo.token.claim'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','true','access.token.claim'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','true','id.token.claim'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','country','user.attribute.country'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','formatted','user.attribute.formatted'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','locality','user.attribute.locality'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','postal_code','user.attribute.postal_code'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','region','user.attribute.region'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','street','user.attribute.street'),('23cb7f54-af1e-48ab-90a1-b68dbf25a2f6','true','userinfo.token.claim'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','true','access.token.claim'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','preferred_username','claim.name'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','true','id.token.claim'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','String','jsonType.label'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','username','user.attribute'),('307fc938-329a-45e9-90cd-6f92fb63dfe6','true','userinfo.token.claim'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','true','access.token.claim'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','resource_access.${client_id}.roles','claim.name'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','String','jsonType.label'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','true','multivalued'),('383fd9c8-2a40-40de-a9cd-1fa649e2d66f','foo','user.attribute'),('3a90b956-68c9-4017-ba69-e297a852d9ff','Role','attribute.name'),('3a90b956-68c9-4017-ba69-e297a852d9ff','Basic','attribute.nameformat'),('3a90b956-68c9-4017-ba69-e297a852d9ff','false','single'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','true','access.token.claim'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','profile','claim.name'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','true','id.token.claim'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','String','jsonType.label'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','profile','user.attribute'),('3caf54cf-de05-4e55-95f8-caf3a530e29d','true','userinfo.token.claim'),('42bcd774-613c-4a21-9f2b-3ff562536a31','true','access.token.claim'),('42bcd774-613c-4a21-9f2b-3ff562536a31','true','id.token.claim'),('42bcd774-613c-4a21-9f2b-3ff562536a31','true','userinfo.token.claim'),('4d3c0392-503a-4022-9e9f-4950f981241c','true','access.token.claim'),('4d3c0392-503a-4022-9e9f-4950f981241c','clientHost','claim.name'),('4d3c0392-503a-4022-9e9f-4950f981241c','true','id.token.claim'),('4d3c0392-503a-4022-9e9f-4950f981241c','String','jsonType.label'),('4d3c0392-503a-4022-9e9f-4950f981241c','clientHost','user.session.note'),('4d3c0392-503a-4022-9e9f-4950f981241c','true','userinfo.token.claim'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','true','access.token.claim'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','website','claim.name'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','true','id.token.claim'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','String','jsonType.label'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','website','user.attribute'),('58aeddc5-6cd3-42f2-8b15-a892842885e5','true','userinfo.token.claim'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','true','access.token.claim'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','groups','claim.name'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','true','id.token.claim'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','String','jsonType.label'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','true','multivalued'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','foo','user.attribute'),('61dc9b79-5a83-4bb7-a1fb-ac25d198dfd2','true','userinfo.token.claim'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','true','access.token.claim'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','upn','claim.name'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','true','id.token.claim'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','String','jsonType.label'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','username','user.attribute'),('6a277b5b-9603-4664-b2f0-fd35f7f37390','true','userinfo.token.claim'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','true','access.token.claim'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','phone_number_verified','claim.name'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','true','id.token.claim'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','boolean','jsonType.label'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','phoneNumberVerified','user.attribute'),('6c8ccd68-7de6-43b5-b8c1-d2a5fe41e65c','true','userinfo.token.claim'),('6d4517a2-5bf1-496c-8c22-1d4299544622','true','access.token.claim'),('6d4517a2-5bf1-496c-8c22-1d4299544622','zoneinfo','claim.name'),('6d4517a2-5bf1-496c-8c22-1d4299544622','true','id.token.claim'),('6d4517a2-5bf1-496c-8c22-1d4299544622','String','jsonType.label'),('6d4517a2-5bf1-496c-8c22-1d4299544622','zoneinfo','user.attribute'),('6d4517a2-5bf1-496c-8c22-1d4299544622','true','userinfo.token.claim'),('6e1ce93a-8853-4af6-9217-626d16db39e0','true','access.token.claim'),('6e1ce93a-8853-4af6-9217-626d16db39e0','family_name','claim.name'),('6e1ce93a-8853-4af6-9217-626d16db39e0','true','id.token.claim'),('6e1ce93a-8853-4af6-9217-626d16db39e0','String','jsonType.label'),('6e1ce93a-8853-4af6-9217-626d16db39e0','lastName','user.attribute'),('6e1ce93a-8853-4af6-9217-626d16db39e0','true','userinfo.token.claim'),('739a46b3-c5ba-47ec-bdd9-4909b0777014','true','access.token.claim'),('739a46b3-c5ba-47ec-bdd9-4909b0777014','realm_access.roles','claim.name'),('739a46b3-c5ba-47ec-bdd9-4909b0777014','String','jsonType.label'),('739a46b3-c5ba-47ec-bdd9-4909b0777014','true','multivalued'),('739a46b3-c5ba-47ec-bdd9-4909b0777014','foo','user.attribute'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','true','access.token.claim'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','resource_access.${client_id}.roles','claim.name'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','String','jsonType.label'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','true','multivalued'),('7418ee33-686b-45aa-b570-a73b4a9d9ed1','foo','user.attribute'),('779a73a9-0588-4c18-99b6-1cef68af4514','true','access.token.claim'),('779a73a9-0588-4c18-99b6-1cef68af4514','gender','claim.name'),('779a73a9-0588-4c18-99b6-1cef68af4514','true','id.token.claim'),('779a73a9-0588-4c18-99b6-1cef68af4514','String','jsonType.label'),('779a73a9-0588-4c18-99b6-1cef68af4514','gender','user.attribute'),('779a73a9-0588-4c18-99b6-1cef68af4514','true','userinfo.token.claim'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','true','access.token.claim'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','upn','claim.name'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','true','id.token.claim'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','String','jsonType.label'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','username','user.attribute'),('781bacc4-9f98-4372-a7f6-6c4f39148b75','true','userinfo.token.claim'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','true','access.token.claim'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','true','id.token.claim'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','country','user.attribute.country'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','formatted','user.attribute.formatted'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','locality','user.attribute.locality'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','postal_code','user.attribute.postal_code'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','region','user.attribute.region'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','street','user.attribute.street'),('7efa1bc4-8576-48c1-9c23-fb9dd296906c','true','userinfo.token.claim'),('823499c5-d6cb-46ad-83f7-18bad335967d','true','access.token.claim'),('823499c5-d6cb-46ad-83f7-18bad335967d','birthdate','claim.name'),('823499c5-d6cb-46ad-83f7-18bad335967d','true','id.token.claim'),('823499c5-d6cb-46ad-83f7-18bad335967d','String','jsonType.label'),('823499c5-d6cb-46ad-83f7-18bad335967d','birthdate','user.attribute'),('823499c5-d6cb-46ad-83f7-18bad335967d','true','userinfo.token.claim'),('8fc68706-62a3-4d35-8133-4c4048c7039a','true','access.token.claim'),('8fc68706-62a3-4d35-8133-4c4048c7039a','clientAddress','claim.name'),('8fc68706-62a3-4d35-8133-4c4048c7039a','true','id.token.claim'),('8fc68706-62a3-4d35-8133-4c4048c7039a','String','jsonType.label'),('8fc68706-62a3-4d35-8133-4c4048c7039a','clientAddress','user.session.note'),('8fc68706-62a3-4d35-8133-4c4048c7039a','true','userinfo.token.claim'),('92545574-8b4a-4d54-b81b-104211692e9c','true','access.token.claim'),('92545574-8b4a-4d54-b81b-104211692e9c','groups','claim.name'),('92545574-8b4a-4d54-b81b-104211692e9c','true','id.token.claim'),('92545574-8b4a-4d54-b81b-104211692e9c','String','jsonType.label'),('92545574-8b4a-4d54-b81b-104211692e9c','true','multivalued'),('92545574-8b4a-4d54-b81b-104211692e9c','foo','user.attribute'),('92ae5b4b-8853-4fd0-a2c7-427420449fc8','true','access.token.claim'),('92ae5b4b-8853-4fd0-a2c7-427420449fc8','true','id.token.claim'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','true','access.token.claim'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','middle_name','claim.name'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','true','id.token.claim'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','String','jsonType.label'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','middleName','user.attribute'),('97b7f675-fa74-4713-a9a2-2f1f87441e6a','true','userinfo.token.claim'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','true','access.token.claim'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','middle_name','claim.name'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','true','id.token.claim'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','String','jsonType.label'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','middleName','user.attribute'),('99399ed3-698b-4f7f-94ce-bde5f8ffc345','true','userinfo.token.claim'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','true','access.token.claim'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','email_verified','claim.name'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','true','id.token.claim'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','boolean','jsonType.label'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','emailVerified','user.attribute'),('9e4eacc9-21b3-4bb1-8ca6-24b37b189cbd','true','userinfo.token.claim'),('9ed583da-0c2a-4a3e-827e-744f92a19030','true','access.token.claim'),('9ed583da-0c2a-4a3e-827e-744f92a19030','locale','claim.name'),('9ed583da-0c2a-4a3e-827e-744f92a19030','true','id.token.claim'),('9ed583da-0c2a-4a3e-827e-744f92a19030','String','jsonType.label'),('9ed583da-0c2a-4a3e-827e-744f92a19030','locale','user.attribute'),('9ed583da-0c2a-4a3e-827e-744f92a19030','true','userinfo.token.claim'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','true','access.token.claim'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','picture','claim.name'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','true','id.token.claim'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','String','jsonType.label'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','picture','user.attribute'),('a5a76443-d2ea-48e8-8257-36f5440a5e73','true','userinfo.token.claim'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','true','access.token.claim'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','gender','claim.name'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','true','id.token.claim'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','String','jsonType.label'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','gender','user.attribute'),('aa4e7ff1-97ca-4641-9559-59d5fda3fd45','true','userinfo.token.claim'),('aa661498-de91-4755-a23b-f9a7848abedc','true','access.token.claim'),('aa661498-de91-4755-a23b-f9a7848abedc','nickname','claim.name'),('aa661498-de91-4755-a23b-f9a7848abedc','true','id.token.claim'),('aa661498-de91-4755-a23b-f9a7848abedc','String','jsonType.label'),('aa661498-de91-4755-a23b-f9a7848abedc','nickname','user.attribute'),('aa661498-de91-4755-a23b-f9a7848abedc','true','userinfo.token.claim'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','true','access.token.claim'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','locale','claim.name'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','true','id.token.claim'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','String','jsonType.label'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','locale','user.attribute'),('afa461ff-9623-4bc3-8d16-cb3cc75393eb','true','userinfo.token.claim'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','true','access.token.claim'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','email_verified','claim.name'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','true','id.token.claim'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','boolean','jsonType.label'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','emailVerified','user.attribute'),('b330ba1d-d0c6-411f-baf3-1b0a99d9aea6','true','userinfo.token.claim'),('c06895c5-813a-40c2-be70-12fedc7ca827','true','access.token.claim'),('c06895c5-813a-40c2-be70-12fedc7ca827','true','id.token.claim'),('c06895c5-813a-40c2-be70-12fedc7ca827','true','userinfo.token.claim'),('c430434e-a764-46ea-8e28-c5c88d619fc6','Role','attribute.name'),('c430434e-a764-46ea-8e28-c5c88d619fc6','Basic','attribute.nameformat'),('c430434e-a764-46ea-8e28-c5c88d619fc6','false','single'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','true','access.token.claim'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','updated_at','claim.name'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','true','id.token.claim'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','long','jsonType.label'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','updatedAt','user.attribute'),('c633d2a8-aee2-44b1-a39e-6a20fc8044c5','true','userinfo.token.claim'),('c650558e-3bfe-4850-8e04-cadacc82b44f','true','access.token.claim'),('c650558e-3bfe-4850-8e04-cadacc82b44f','phone_number','claim.name'),('c650558e-3bfe-4850-8e04-cadacc82b44f','true','id.token.claim'),('c650558e-3bfe-4850-8e04-cadacc82b44f','String','jsonType.label'),('c650558e-3bfe-4850-8e04-cadacc82b44f','phoneNumber','user.attribute'),('c650558e-3bfe-4850-8e04-cadacc82b44f','true','userinfo.token.claim'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','true','access.token.claim'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','phone_number_verified','claim.name'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','true','id.token.claim'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','boolean','jsonType.label'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','phoneNumberVerified','user.attribute'),('c88cc1e3-bb2c-4ea5-9177-5c0e8387435e','true','userinfo.token.claim'),('cbbab083-820b-47cb-a92a-c02b09df0f19','true','access.token.claim'),('cbbab083-820b-47cb-a92a-c02b09df0f19','nickname','claim.name'),('cbbab083-820b-47cb-a92a-c02b09df0f19','true','id.token.claim'),('cbbab083-820b-47cb-a92a-c02b09df0f19','String','jsonType.label'),('cbbab083-820b-47cb-a92a-c02b09df0f19','nickname','user.attribute'),('cbbab083-820b-47cb-a92a-c02b09df0f19','true','userinfo.token.claim'),('d5005371-f7e5-423e-b941-d339e0094494','true','access.token.claim'),('d5005371-f7e5-423e-b941-d339e0094494','locale','claim.name'),('d5005371-f7e5-423e-b941-d339e0094494','true','id.token.claim'),('d5005371-f7e5-423e-b941-d339e0094494','String','jsonType.label'),('d5005371-f7e5-423e-b941-d339e0094494','locale','user.attribute'),('d5005371-f7e5-423e-b941-d339e0094494','true','userinfo.token.claim'),('db0c1f63-5958-4515-940c-f18b7cb2c794','true','access.token.claim'),('db0c1f63-5958-4515-940c-f18b7cb2c794','locale','claim.name'),('db0c1f63-5958-4515-940c-f18b7cb2c794','true','id.token.claim'),('db0c1f63-5958-4515-940c-f18b7cb2c794','String','jsonType.label'),('db0c1f63-5958-4515-940c-f18b7cb2c794','locale','user.attribute'),('db0c1f63-5958-4515-940c-f18b7cb2c794','true','userinfo.token.claim'),('de6e0a88-047e-47aa-a99d-92ca46d496da','true','access.token.claim'),('de6e0a88-047e-47aa-a99d-92ca46d496da','realm_access.roles','claim.name'),('de6e0a88-047e-47aa-a99d-92ca46d496da','String','jsonType.label'),('de6e0a88-047e-47aa-a99d-92ca46d496da','true','multivalued'),('de6e0a88-047e-47aa-a99d-92ca46d496da','foo','user.attribute'),('f3f1b848-5aa0-4107-bae4-715d34235982','true','access.token.claim'),('f3f1b848-5aa0-4107-bae4-715d34235982','email','claim.name'),('f3f1b848-5aa0-4107-bae4-715d34235982','true','id.token.claim'),('f3f1b848-5aa0-4107-bae4-715d34235982','String','jsonType.label'),('f3f1b848-5aa0-4107-bae4-715d34235982','email','user.attribute'),('f3f1b848-5aa0-4107-bae4-715d34235982','true','userinfo.token.claim'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','true','access.token.claim'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','clientId','claim.name'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','true','id.token.claim'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','String','jsonType.label'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','clientId','user.session.note'),('f6164aa9-1bcd-44c0-b5fe-91b48ff02103','true','userinfo.token.claim'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','true','access.token.claim'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','preferred_username','claim.name'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','true','id.token.claim'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','String','jsonType.label'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','username','user.attribute'),('f8fddd1a-0ce2-429a-bcb8-ca81e4cafaba','true','userinfo.token.claim'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','true','access.token.claim'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','profile','claim.name'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','true','id.token.claim'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','String','jsonType.label'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','profile','user.attribute'),('f90ebbf0-9868-45cd-acc3-88b2d811d80d','true','userinfo.token.claim'),('fb798582-d9d9-42cc-9150-5d04d905bffa','true','access.token.claim'),('fb798582-d9d9-42cc-9150-5d04d905bffa','given_name','claim.name'),('fb798582-d9d9-42cc-9150-5d04d905bffa','true','id.token.claim'),('fb798582-d9d9-42cc-9150-5d04d905bffa','String','jsonType.label'),('fb798582-d9d9-42cc-9150-5d04d905bffa','firstName','user.attribute'),('fb798582-d9d9-42cc-9150-5d04d905bffa','true','userinfo.token.claim'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','true','access.token.claim'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','email','claim.name'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','true','id.token.claim'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','String','jsonType.label'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','email','user.attribute'),('fd1f16fb-b9bb-4f4c-846a-5d8f530fd50b','true','userinfo.token.claim'),('fdcb090e-0998-4372-8b56-670734a806bb','true','access.token.claim'),('fdcb090e-0998-4372-8b56-670734a806bb','family_name','claim.name'),('fdcb090e-0998-4372-8b56-670734a806bb','true','id.token.claim'),('fdcb090e-0998-4372-8b56-670734a806bb','String','jsonType.label'),('fdcb090e-0998-4372-8b56-670734a806bb','lastName','user.attribute'),('fdcb090e-0998-4372-8b56-670734a806bb','true','userinfo.token.claim'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','true','access.token.claim'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','given_name','claim.name'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','true','id.token.claim'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','String','jsonType.label'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','firstName','user.attribute'),('ffba76a9-f894-45c5-ab6b-6c0aeeb9a797','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('1cf86083-1024-4ace-a31d-ab4723365ab6',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'institute-management',0,NULL,_binary '',_binary '',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '','201b787c-2f22-4495-9581-ff0dc5485d15',1800,_binary '\0',NULL,_binary '',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','60e177db-2a32-46ca-804c-d6668c8b7f4f','5c709356-f146-464f-98ac-69a3aac174b0','1932a086-9fce-47d5-9cf6-54de9db6f283','1ded67d7-68fe-430e-ba2f-ac21034e6b64','1ba57a81-10eb-4a87-9ad9-8338ee336d97',2592000,_binary '\0',900,_binary '',_binary '\0','3a889bc2-95a9-4313-84de-70efd9f091e6',0,_binary '\0',0,0,'e754152c-1bca-42ec-be41-ecde82802147'),('875d0d7d-7037-4f48-9a40-1307264daea6',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','81123f05-0cf2-46bd-b502-9b69b4b38987',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','e27f5fde-d575-4807-b828-94a999d4ac72','68ed7cb9-07ae-48af-944d-d690f5e258a7','3d2fb627-aae3-4e73-a0ed-0bf9bea8694d','780f35f3-5e1c-4214-9283-0860c328cc00','23b38362-2f17-4e96-975b-119afe4081f5',2592000,_binary '\0',900,_binary '',_binary '\0','c956fdfa-6cae-43a2-a1e9-2a607a7fa759',0,_binary '\0',0,0,'1ceabb71-222b-4190-a150-510a0f693e00');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','1cf86083-1024-4ace-a31d-ab4723365ab6','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','875d0d7d-7037-4f48-9a40-1307264daea6','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','1cf86083-1024-4ace-a31d-ab4723365ab6',''),('_browser_header.contentSecurityPolicyReportOnly','875d0d7d-7037-4f48-9a40-1307264daea6',''),('_browser_header.strictTransportSecurity','1cf86083-1024-4ace-a31d-ab4723365ab6','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','875d0d7d-7037-4f48-9a40-1307264daea6','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','1cf86083-1024-4ace-a31d-ab4723365ab6','nosniff'),('_browser_header.xContentTypeOptions','875d0d7d-7037-4f48-9a40-1307264daea6','nosniff'),('_browser_header.xFrameOptions','1cf86083-1024-4ace-a31d-ab4723365ab6','SAMEORIGIN'),('_browser_header.xFrameOptions','875d0d7d-7037-4f48-9a40-1307264daea6','SAMEORIGIN'),('_browser_header.xRobotsTag','1cf86083-1024-4ace-a31d-ab4723365ab6','none'),('_browser_header.xRobotsTag','875d0d7d-7037-4f48-9a40-1307264daea6','none'),('_browser_header.xXSSProtection','1cf86083-1024-4ace-a31d-ab4723365ab6','1; mode=block'),('_browser_header.xXSSProtection','875d0d7d-7037-4f48-9a40-1307264daea6','1; mode=block'),('actionTokenGeneratedByAdminLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','43200'),('actionTokenGeneratedByUserLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','300'),('bruteForceProtected','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('bruteForceProtected','875d0d7d-7037-4f48-9a40-1307264daea6','false'),('cibaAuthRequestedUserHint','1cf86083-1024-4ace-a31d-ab4723365ab6','login_hint'),('cibaBackchannelTokenDeliveryMode','1cf86083-1024-4ace-a31d-ab4723365ab6','poll'),('cibaExpiresIn','1cf86083-1024-4ace-a31d-ab4723365ab6','120'),('cibaInterval','1cf86083-1024-4ace-a31d-ab4723365ab6','5'),('client-policies.policies','1cf86083-1024-4ace-a31d-ab4723365ab6','{\"policies\":[]}'),('client-policies.profiles','1cf86083-1024-4ace-a31d-ab4723365ab6','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('clientOfflineSessionMaxLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('clientSessionIdleTimeout','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('clientSessionMaxLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('defaultSignatureAlgorithm','1cf86083-1024-4ace-a31d-ab4723365ab6','RS256'),('defaultSignatureAlgorithm','875d0d7d-7037-4f48-9a40-1307264daea6','RS256'),('displayName','875d0d7d-7037-4f48-9a40-1307264daea6','Keycloak'),('displayNameHtml','875d0d7d-7037-4f48-9a40-1307264daea6','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','1cf86083-1024-4ace-a31d-ab4723365ab6','30'),('failureFactor','875d0d7d-7037-4f48-9a40-1307264daea6','30'),('maxDeltaTimeSeconds','1cf86083-1024-4ace-a31d-ab4723365ab6','43200'),('maxDeltaTimeSeconds','875d0d7d-7037-4f48-9a40-1307264daea6','43200'),('maxFailureWaitSeconds','1cf86083-1024-4ace-a31d-ab4723365ab6','900'),('maxFailureWaitSeconds','875d0d7d-7037-4f48-9a40-1307264daea6','900'),('minimumQuickLoginWaitSeconds','1cf86083-1024-4ace-a31d-ab4723365ab6','60'),('minimumQuickLoginWaitSeconds','875d0d7d-7037-4f48-9a40-1307264daea6','60'),('oauth2DeviceCodeLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','600'),('oauth2DevicePollingInterval','1cf86083-1024-4ace-a31d-ab4723365ab6','5'),('offlineSessionMaxLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','5184000'),('offlineSessionMaxLifespan','875d0d7d-7037-4f48-9a40-1307264daea6','5184000'),('offlineSessionMaxLifespanEnabled','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('offlineSessionMaxLifespanEnabled','875d0d7d-7037-4f48-9a40-1307264daea6','false'),('parRequestUriLifespan','1cf86083-1024-4ace-a31d-ab4723365ab6','60'),('permanentLockout','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('permanentLockout','875d0d7d-7037-4f48-9a40-1307264daea6','false'),('quickLoginCheckMilliSeconds','1cf86083-1024-4ace-a31d-ab4723365ab6','1000'),('quickLoginCheckMilliSeconds','875d0d7d-7037-4f48-9a40-1307264daea6','1000'),('realmReusableOtpCode','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('realmReusableOtpCode','875d0d7d-7037-4f48-9a40-1307264daea6','false'),('waitIncrementSeconds','1cf86083-1024-4ace-a31d-ab4723365ab6','60'),('waitIncrementSeconds','875d0d7d-7037-4f48-9a40-1307264daea6','60'),('webAuthnPolicyAttestationConveyancePreference','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyAuthenticatorAttachment','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','false'),('webAuthnPolicyCreateTimeout','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('webAuthnPolicyCreateTimeoutPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','0'),('webAuthnPolicyRequireResidentKey','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyRpEntityName','1cf86083-1024-4ace-a31d-ab4723365ab6','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','keycloak'),('webAuthnPolicyRpId','1cf86083-1024-4ace-a31d-ab4723365ab6',''),('webAuthnPolicyRpIdPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6',''),('webAuthnPolicySignatureAlgorithms','1cf86083-1024-4ace-a31d-ab4723365ab6','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','ES256'),('webAuthnPolicyUserVerificationRequirement','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','1cf86083-1024-4ace-a31d-ab4723365ab6','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('1cf86083-1024-4ace-a31d-ab4723365ab6','jboss-logging'),('875d0d7d-7037-4f48-9a40-1307264daea6','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','1cf86083-1024-4ace-a31d-ab4723365ab6'),('password','password',_binary '',_binary '','875d0d7d-7037-4f48-9a40-1307264daea6');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('1407631e-e679-4cff-83b6-ee30e436ae4d','/realms/institute-management/account/*'),('1dfe32a0-7778-40d8-b635-89fd3f383db4','*'),('6bbad496-2df1-4ff6-8639-fd89936c8605','/realms/master/account/*'),('7763a689-4032-44df-acf1-3931c2e34202','/realms/institute-management/account/*'),('83ae6f59-7c8b-4115-872f-9526bacecefa','/admin/master/console/*'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','/admin/institute-management/console/*'),('d26c2010-74ab-4211-b1a2-b0a3a7056c26','/realms/master/account/*'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0548109b-d28b-4dd8-846e-8e18d19334c1','webauthn-register','Webauthn Register','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','webauthn-register',70),('059a301a-2caa-48ac-b0ec-051e91b32bce','terms_and_conditions','Terms and Conditions','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '\0',_binary '\0','terms_and_conditions',20),('4c6560d0-ceb3-4fc3-9be8-ea56feb3a6fc','UPDATE_PASSWORD','Update Password','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','UPDATE_PASSWORD',30),('4dd324f7-c25c-4502-948a-d1611f0a3199','update_user_locale','Update User Locale','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','update_user_locale',1000),('51ab38ae-fe53-44e7-83c3-5fbb0212a1e5','delete_account','Delete Account','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '\0',_binary '\0','delete_account',60),('5adc8d48-ce1a-4c9f-ac79-2901d7550284','VERIFY_EMAIL','Verify Email','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','VERIFY_EMAIL',50),('5d2dbb82-c903-490a-9828-5e27f6bd1604','webauthn-register-passwordless','Webauthn Register Passwordless','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','webauthn-register-passwordless',80),('5dcf1b09-2910-4b68-a64b-ba13b42282e8','CONFIGURE_TOTP','Configure OTP','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','CONFIGURE_TOTP',10),('61ad5c7a-ff4a-464b-9d00-31a479c921ee','UPDATE_PROFILE','Update Profile','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','UPDATE_PROFILE',40),('730bb28d-2004-4ba0-b8c1-c71a85d7e059','CONFIGURE_TOTP','Configure OTP','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','CONFIGURE_TOTP',10),('7e392e58-1d4e-4440-9fa9-cd2b6fa4f61a','terms_and_conditions','Terms and Conditions','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0',_binary '\0','terms_and_conditions',20),('8c5067a7-eff6-498f-bbce-207ea72cf8b3','delete_account','Delete Account','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '\0',_binary '\0','delete_account',60),('9b2b4d5a-2bfc-4bc8-ae89-8d4786a163f6','webauthn-register-passwordless','Webauthn Register Passwordless','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','webauthn-register-passwordless',80),('bdb21fbb-f1b4-472c-8c3c-6aa7ac9ce1e4','UPDATE_PROFILE','Update Profile','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','UPDATE_PROFILE',40),('de1e5f29-9e6f-44bf-8d82-c9ad005df1c3','VERIFY_EMAIL','Verify Email','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','VERIFY_EMAIL',50),('e2f5ef31-6a0e-4a55-a30d-4c2327ff4e3f','webauthn-register','Webauthn Register','875d0d7d-7037-4f48-9a40-1307264daea6',_binary '',_binary '\0','webauthn-register',70),('e3fc6439-4dcd-4dd5-9196-4c6f6878dc9a','update_user_locale','Update User Locale','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','update_user_locale',1000),('f4075209-c767-4fd1-b90e-6cadb6845273','UPDATE_PASSWORD','Update Password','1cf86083-1024-4ace-a31d-ab4723365ab6',_binary '',_binary '\0','UPDATE_PASSWORD',30);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',_binary '','0',1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('5e17926b-6297-408b-b94c-883ab5ec0b88','Default Resource','urn:institute-management-service:resources:default',NULL,'f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('5e17926b-6297-408b-b94c-883ab5ec0b88','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('7763a689-4032-44df-acf1-3931c2e34202','4db75efa-8204-4fe8-9ddf-b337126adeb2'),('6bbad496-2df1-4ff6-8639-fd89936c8605','c6cb523d-0dea-487c-b82d-9d3536389167'),('7763a689-4032-44df-acf1-3931c2e34202','e31adcf7-6b41-4d32-b6dc-12168578514b'),('6bbad496-2df1-4ff6-8639-fd89936c8605','ff41c670-c597-4bcb-a495-b9d5cfcb991c');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','2261d932-28ba-49c5-8cee-aef269f80cf0','f042d9b1-3234-49b7-b738-b6cbc5117c24');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('2261d932-28ba-49c5-8cee-aef269f80cf0',NULL,'aed5828e-a1f0-4ed4-93b6-c4ebd7cb657a',_binary '',_binary '',NULL,'Buğra','Sessevmez','875d0d7d-7037-4f48-9a40-1307264daea6','admin',1681223609741,NULL,0),('3843e620-e245-4d3c-8e5c-5f344233873a',NULL,'40d75e06-a952-49e4-8223-5f3247f9ded0',_binary '',_binary '',NULL,'','','1cf86083-1024-4ace-a31d-ab4723365ab6','',1672849555341,'f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f',0),('bd379fa3-ef10-4259-832b-b2de23854c9e','sessevmezbugra@gmail.com','sessevmezbugra@gmail.com',_binary '',_binary '',NULL,'Buğra','Sessevmez','1cf86083-1024-4ace-a31d-ab4723365ab6','sessevmezbugra@gmail.com',1681230636320,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('005626ab-3978-4978-aca4-3699a5fe2d1f','2261d932-28ba-49c5-8cee-aef269f80cf0'),('04fd0638-6234-4ea3-a34b-e839ac4b8e50','2261d932-28ba-49c5-8cee-aef269f80cf0'),('066bb51b-b9cd-40b8-b8fc-62ade1015507','2261d932-28ba-49c5-8cee-aef269f80cf0'),('0817f4c8-c1f1-47dd-8874-4261d677972a','2261d932-28ba-49c5-8cee-aef269f80cf0'),('0c48ce38-6104-4ff2-b570-3342603c580c','2261d932-28ba-49c5-8cee-aef269f80cf0'),('0e591f4a-a862-4d9b-aa06-3530e10b33da','2261d932-28ba-49c5-8cee-aef269f80cf0'),('11e83b92-9639-473e-aa7d-a302cb6c071e','2261d932-28ba-49c5-8cee-aef269f80cf0'),('19e31d1a-5b8e-487d-8c32-4b7a925b8fe4','2261d932-28ba-49c5-8cee-aef269f80cf0'),('1b8bc9ba-d535-4d88-bd94-b485a4c0b62e','2261d932-28ba-49c5-8cee-aef269f80cf0'),('1ceabb71-222b-4190-a150-510a0f693e00','2261d932-28ba-49c5-8cee-aef269f80cf0'),('29d6451b-eebf-454d-8b0c-27072c5d9396','2261d932-28ba-49c5-8cee-aef269f80cf0'),('2a18f1dd-e9b4-420d-b820-e03ba9656aa7','2261d932-28ba-49c5-8cee-aef269f80cf0'),('2c201297-74ae-4575-96f0-2364006df9c5','2261d932-28ba-49c5-8cee-aef269f80cf0'),('39f54c88-11c2-4515-ac98-3d4d70419bc6','2261d932-28ba-49c5-8cee-aef269f80cf0'),('3a1c57f4-1bbc-4723-86c6-c7aa79e48ecd','2261d932-28ba-49c5-8cee-aef269f80cf0'),('3accd4ba-1440-4e02-a140-6e22517300e3','2261d932-28ba-49c5-8cee-aef269f80cf0'),('3bf25ef9-b901-474e-807a-a90b097da04d','2261d932-28ba-49c5-8cee-aef269f80cf0'),('40e479fe-5346-47c6-936f-98278f889c9c','2261d932-28ba-49c5-8cee-aef269f80cf0'),('4431219f-5daa-42f6-a499-edf0764a9f8f','2261d932-28ba-49c5-8cee-aef269f80cf0'),('4a665f20-6a13-4db5-b0b6-186270972f69','2261d932-28ba-49c5-8cee-aef269f80cf0'),('51514013-bf40-4f36-a566-f4b9af79cf6f','2261d932-28ba-49c5-8cee-aef269f80cf0'),('51c8c2c2-0ff0-498b-b7da-66cdb8f0c835','2261d932-28ba-49c5-8cee-aef269f80cf0'),('56ad0191-c5b4-4908-a61b-95d534008cfa','2261d932-28ba-49c5-8cee-aef269f80cf0'),('5b84f73f-a3b7-4a5c-970e-f6f89a227f5d','2261d932-28ba-49c5-8cee-aef269f80cf0'),('66eee077-e4bf-4187-9cf6-184e126a6879','2261d932-28ba-49c5-8cee-aef269f80cf0'),('75cd99d8-b062-48fc-88a9-d1a079575f9c','2261d932-28ba-49c5-8cee-aef269f80cf0'),('7710bf33-d7d4-48eb-8178-810ea7809ed0','2261d932-28ba-49c5-8cee-aef269f80cf0'),('7dd162da-210a-4a4e-879b-dff79b57823d','2261d932-28ba-49c5-8cee-aef269f80cf0'),('7fae1537-1c83-4c5b-99e6-db4e0a892eb1','2261d932-28ba-49c5-8cee-aef269f80cf0'),('92dcc8f6-9b64-4b3b-8e03-08ee1cf0f44c','2261d932-28ba-49c5-8cee-aef269f80cf0'),('99ea49ed-77b7-46b5-9759-948cdd436b01','2261d932-28ba-49c5-8cee-aef269f80cf0'),('9fcec60a-d9fc-4706-84ac-05b15b1da871','2261d932-28ba-49c5-8cee-aef269f80cf0'),('b368859c-39ce-4dc6-a045-4f0246e083ec','2261d932-28ba-49c5-8cee-aef269f80cf0'),('b82e6790-0f3d-4cca-a040-45e0b42bc1f9','2261d932-28ba-49c5-8cee-aef269f80cf0'),('c0085792-4509-4e93-ab3c-326c7a3c2c45','2261d932-28ba-49c5-8cee-aef269f80cf0'),('c27706ed-869e-4d4d-85d5-ca50d65c3f3d','2261d932-28ba-49c5-8cee-aef269f80cf0'),('c5f4a789-26a8-48e0-832f-44a50b1a6ab3','2261d932-28ba-49c5-8cee-aef269f80cf0'),('c6cb523d-0dea-487c-b82d-9d3536389167','2261d932-28ba-49c5-8cee-aef269f80cf0'),('d42c67c3-77e7-4245-9866-f558d626abc4','2261d932-28ba-49c5-8cee-aef269f80cf0'),('d5a49f25-f710-4373-8299-de70a0a6ab69','2261d932-28ba-49c5-8cee-aef269f80cf0'),('d633335a-6a12-479f-ac7e-22bfa21d13b6','2261d932-28ba-49c5-8cee-aef269f80cf0'),('d7fd513d-a7be-4e63-abc6-65e923768ae0','2261d932-28ba-49c5-8cee-aef269f80cf0'),('e629199f-a488-4c6d-adb1-491f38090e44','2261d932-28ba-49c5-8cee-aef269f80cf0'),('f254a40c-aae1-426d-8e45-8945b87f2dd9','2261d932-28ba-49c5-8cee-aef269f80cf0'),('f2b55ae6-814b-45eb-845c-ca561cbe074f','2261d932-28ba-49c5-8cee-aef269f80cf0'),('f2e08d13-4ece-45a4-abe1-59ed2e964252','2261d932-28ba-49c5-8cee-aef269f80cf0'),('fd6b989b-7e59-4c5a-9f55-f059fe8e344f','2261d932-28ba-49c5-8cee-aef269f80cf0'),('fe558042-79e0-442a-b7d5-68836c6f4a96','2261d932-28ba-49c5-8cee-aef269f80cf0'),('feda7957-2515-4c2c-b548-4e8007a82a96','2261d932-28ba-49c5-8cee-aef269f80cf0'),('ff41c670-c597-4bcb-a495-b9d5cfcb991c','2261d932-28ba-49c5-8cee-aef269f80cf0'),('1b3e569f-b675-4903-afbb-e2a9d0c95f96','3843e620-e245-4d3c-8e5c-5f344233873a'),('208ea27d-70a3-42a5-92d5-75734b046904','3843e620-e245-4d3c-8e5c-5f344233873a'),('23b99e0e-61e7-4bc3-93ea-d4d2d1c42e85','3843e620-e245-4d3c-8e5c-5f344233873a'),('258b03cb-1498-4992-8063-0b2895e1e18f','3843e620-e245-4d3c-8e5c-5f344233873a'),('2c0765e1-fa9f-413a-b191-e9a1088f8954','3843e620-e245-4d3c-8e5c-5f344233873a'),('30020238-ca6e-41fb-b60b-39d6c23363c3','3843e620-e245-4d3c-8e5c-5f344233873a'),('34e26e61-9c56-4799-b0e5-adc730e41e22','3843e620-e245-4d3c-8e5c-5f344233873a'),('42f203ad-8e47-4791-b7cd-b793a61b5c4c','3843e620-e245-4d3c-8e5c-5f344233873a'),('4498f2ec-ed25-4436-8964-c457a82ba992','3843e620-e245-4d3c-8e5c-5f344233873a'),('4d4dc98f-fff2-44eb-8729-083eedfeef85','3843e620-e245-4d3c-8e5c-5f344233873a'),('4db75efa-8204-4fe8-9ddf-b337126adeb2','3843e620-e245-4d3c-8e5c-5f344233873a'),('4ead7531-1a56-4264-853f-502a06468313','3843e620-e245-4d3c-8e5c-5f344233873a'),('594cfd22-539b-43a3-afd8-a4662aa52568','3843e620-e245-4d3c-8e5c-5f344233873a'),('6494f5e8-6071-4660-ba48-c969a9d4ffc3','3843e620-e245-4d3c-8e5c-5f344233873a'),('65deca55-6329-4bd4-8b7c-0b124244d6cf','3843e620-e245-4d3c-8e5c-5f344233873a'),('6c60a1ae-8394-4659-a67c-aa89c26f224b','3843e620-e245-4d3c-8e5c-5f344233873a'),('6df700b8-9f25-4a69-a8ef-571a9a5a2b86','3843e620-e245-4d3c-8e5c-5f344233873a'),('6ea7a60a-fee4-4584-9123-bb5c57435f4a','3843e620-e245-4d3c-8e5c-5f344233873a'),('76ac3863-0d28-4ed9-a81b-9a63bc979db6','3843e620-e245-4d3c-8e5c-5f344233873a'),('918d3498-505e-4c44-bbb6-fbd2d7244f55','3843e620-e245-4d3c-8e5c-5f344233873a'),('989f35c0-2c60-414e-b449-831ae5309e3d','3843e620-e245-4d3c-8e5c-5f344233873a'),('9cdcd62a-3877-4069-9c77-71ae90384019','3843e620-e245-4d3c-8e5c-5f344233873a'),('a28caf4e-c61f-4299-b1a6-f5eb74b9727b','3843e620-e245-4d3c-8e5c-5f344233873a'),('af555bee-29a2-4248-a4cb-e9ad7b9d8e5c','3843e620-e245-4d3c-8e5c-5f344233873a'),('bd0abc4c-cb0f-40c0-9297-7c982dc46007','3843e620-e245-4d3c-8e5c-5f344233873a'),('d09c7ca6-7acc-4740-9abb-1cfca6098c20','3843e620-e245-4d3c-8e5c-5f344233873a'),('da35cf78-ca8f-47c4-bcd9-3afa86d5a354','3843e620-e245-4d3c-8e5c-5f344233873a'),('dd2537dc-ebbf-4dcc-95c8-a8ed57d064e4','3843e620-e245-4d3c-8e5c-5f344233873a'),('e0d33389-5a6d-420c-afc2-a1c8397da085','3843e620-e245-4d3c-8e5c-5f344233873a'),('e31adcf7-6b41-4d32-b6dc-12168578514b','3843e620-e245-4d3c-8e5c-5f344233873a'),('e754152c-1bca-42ec-be41-ecde82802147','3843e620-e245-4d3c-8e5c-5f344233873a'),('ef4493a8-35af-4a61-9308-681e5f53a84d','3843e620-e245-4d3c-8e5c-5f344233873a'),('e754152c-1bca-42ec-be41-ecde82802147','bd379fa3-ef10-4259-832b-b2de23854c9e');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('1dfe32a0-7778-40d8-b635-89fd3f383db4','*'),('83ae6f59-7c8b-4115-872f-9526bacecefa','+'),('92e9743c-4142-4eb3-9c0f-8a37c359ebb2','+'),('f4ebf18d-23b8-4d33-a8bf-ed6ef0fdb36f','*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 20:03:15
