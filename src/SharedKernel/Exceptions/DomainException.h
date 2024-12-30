#pragma once
#include <stdexcept>
#include <string>

namespace SharedKernel::Exceptions {

class DomainException : public std::runtime_error {
public:
  explicit DomainException(const std::string& message)
      : std::runtime_error("Domain exception: " + message) {};
};

}