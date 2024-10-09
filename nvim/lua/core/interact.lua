local M = {}

--- Prompt the user for confirmation and execute a callback based on their input.
--- @param message string The message to display to the user.
--- @param onTrue function The callback to execute if the user confirms.
--- @param onFalse function The callback to execute if the user cancels.
--- @return boolean True if the callback was executed; false otherwise.
function M.confirm(message, onTrue, onFalse)
    local choice = vim.fn.input(message);
    if choice ~= "y" and choice ~= "Y" then
        onFalse()
        return false
    end

    onTrue()
    return true
end

--- Prompt the user for a choice and execute a callback with that choice as a parameter.
--- @param message string The message to display to the user.
--- @param onTrue function The callback to execute. Will be passed a parameter containing the user's input.
--- @param onFalse function The callback to execute if the user cancels.
--- @return boolean True if the callback was executed; false otherwise.
function M.prompt(message, onTrue, onFalse)
    local choice = vim.fn.input(message)
    if choice == "" then
        onFalse()
        return false
    end

    onTrue(choice)
    return true
end

return M
