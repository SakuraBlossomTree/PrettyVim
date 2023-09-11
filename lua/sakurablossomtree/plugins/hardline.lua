local setup, hardline = pcall(require, "hardline")
if not setup then
    return
end

hardline.setup()
