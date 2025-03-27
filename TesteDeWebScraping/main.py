import os.path
import time
import zipfile

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
class GovPageObjetct:
    def __init__(self, driver):
        self.driver = driver
        self.link = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
        self.cookiesButton = '//*[contains(text(), "Aceitar cookies")]'
        self.attachmentOneLink = '//a[contains(text(), "Anexo I.")]'
        self.attachmentOneFileName = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
        self.attachmentTwoLink = '//a[contains(text(), "Anexo II.")]'
        self.attachmentTwoFileName = "Anexo_II_DUT_2021_RN_465.2021_RN628.2025_RN629.2025.pdf"
        self.downloadDict = os.path.join(os.path.dirname(__file__),"docs")
        self.zipDict = os.path.join(os.path.dirname(__file__), "zips")

    def accessPage(self):
        driver.get(self.link)

    def acceptCookies(self):
        self.driver.find_element(By.XPATH, self.cookiesButton).click()

    def waitAttachmentDownload(self, fileName):
        filePath = os.path.join(self.downloadDict, fileName)
        maxTime = 30
        initialTime = time.time()
        while not os.path.exists(filePath):
            if time.time() - initialTime > maxTime:
                raise TimeoutError("Download failed!")
            time.sleep(1)
    def cleanAttachmentDict(self):
        attachmentOnePath =os.path.join(self.downloadDict,self.attachmentOneFileName)
        attachmentTwoPath = os.path.join(self.downloadDict, self.attachmentTwoFileName)
        if os.path.exists(attachmentOnePath):
            os.remove(attachmentOnePath)
        if os.path.exists(attachmentTwoPath):
            os.remove(attachmentTwoPath)
    def downloadAttachmentOne(self):
        self.driver.find_element(By.XPATH,self.attachmentOneLink).click()
        self.waitAttachmentDownload(self.attachmentOneFileName)
    def downloadAttachmentTwo(self):
        self.driver.find_element(By.XPATH,self.attachmentTwoLink).click()
        self.waitAttachmentDownload(self.attachmentTwoFileName)

    def compressAttachments(self):
        pdfFiles = [os.path.join(self.downloadDict,self.attachmentOneFileName), os.path.join(self.downloadDict,self.attachmentTwoFileName)]
        zipName = os.path.join(self.zipDict, "anexo_ii_e_anexoii_"+time.time().__str__()+".zip")
        with zipfile.ZipFile(zipName, 'w',compression=zipfile.ZIP_DEFLATED) as zipf:
            [zipf.write(pdf) for pdf in pdfFiles]

    def extractAttachmentsAndZipWithTeardown(self):
        self.accessPage()
        self.acceptCookies()
        self.downloadAttachmentOne()
        self.downloadAttachmentTwo()
        self.compressAttachments()
        self.cleanAttachmentDict()

chrome_options = Options()
prefs = {
"plugins.always_open_pdf_externally": True,
    "download.default_directory": os.path.join(os.path.dirname(__file__),"docs"),
    "download.prompt_for_download": False,
    "download.directory_upgrade": True,
}
chrome_options.add_experimental_option("prefs", prefs)
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()),options=chrome_options)
govPage = GovPageObjetct(driver)
govPage.extractAttachmentsAndZipWithTeardown()
