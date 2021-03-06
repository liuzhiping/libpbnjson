// @@@LICENSE
//
//      Copyright (c) 2009-2012 Hewlett-Packard Development Company, L.P.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// LICENSE@@@

#cmakedefine HAVE_PCRE 1
#cmakedefine HAVE_POSIX_REGEXP 1

#if HAVE_PCRE
    #include <pcreposix.h>
#elif HAVE_POSIX_REGEXP
    #ifdef NDEBUG
        #warning "Using POSIX regular expressions - this violates the JSON schema spec"
    #endif 
    #include <regex.h>
#else
    #error "No regular expression support provided - schema requires them"
#endif

#if HAVE_PCRE || HAVE_POSIX_REGEXP
/* 
 * USE_POSIX_REGEXP determines whether or not we use the POSIX API for accessing the
 * regular expression engine.
 */
#define USE_POSIX_REGEXP 1
#endif