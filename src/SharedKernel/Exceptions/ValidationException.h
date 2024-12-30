#pragma once
#include <stdexcept>
#include <string>

namespace SharedKernel::Exceptions {
class ValidationException : public std::runtime_error {
  public:
    explicit ValidationException(const std::string& message)
        : std::runtime_error("Validation exception: " + message) {};
};
}