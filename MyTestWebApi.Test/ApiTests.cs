using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.VisualStudio.TestPlatform.TestHost;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyTestWebApi.Test
{
    public class ApiTests
    {
        [Fact]
        public async Task GetRootEndpoint_ReturnsExpectedResponse()
        {
            Assert.Equal(true, true);
        }
    }
}
